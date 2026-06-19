import os
import uuid
from fastapi import FastAPI, HTTPException, status
from pydantic import BaseModel
from typing import List, Optional
import logging

# Kubernetes client import
try:
    from kubernetes import client, config
    K8S_AVAILABLE = True
except ImportError:
    K8S_AVAILABLE = False

# Configure logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger("AI-ForgeStream-API")

app = FastAPI(
    title="AI-ForgeStream Orchestration Control Plane",
    description="Production-grade OTT Transcoding & Loudness Normalization Orchestrator",
    version="2.0.0"
)

# Initialize Kubernetes Configuration
if K8S_AVAILABLE:
    try:
        config.load_incluster_config()
        logger.info("Loaded in-cluster Kubernetes configuration")
    except Exception as e:
        try:
            config.load_kube_config()
            logger.info("Loaded external kubeconfig file")
        except Exception as ex:
            logger.warning(f"Kubernetes client could not be initialized: {ex}")
            K8S_AVAILABLE = False
else:
    logger.warning("Kubernetes Python package not available. Running in Mock Mode.")

class JobSubmission(BaseModel):
    input_file: str  # Path relative to the PVC mount, e.g., "input.mp4"
    output_dir: str  # Path relative to the PVC mount, e.g., "output/hls"
    target_lufs: float = -24.0

class JobStatusResponse(BaseModel):
    job_name: str
    status: str
    active: Optional[int] = 0
    succeeded: Optional[int] = 0
    failed: Optional[int] = 0
    start_time: Optional[str] = None
    completion_time: Optional[str] = None

# Healthcheck
@app.get("/health", status_code=status.HTTP_200_OK)
def health_check():
    return {
        "status": "healthy",
        "kubernetes_connected": K8S_AVAILABLE,
        "namespace": os.getenv("K8S_NAMESPACE", "ai-forgestream")
    }

@app.post("/jobs/submit", response_model=dict, status_code=status.HTTP_201_CREATED)
def submit_job(submission: JobSubmission):
    if not K8S_AVAILABLE:
        raise HTTPException(
            status_code=status.HTTP_503_SERVICE_UNAVAILABLE,
            detail="Kubernetes orchestration client is not available or not configured."
        )
    
    namespace = os.getenv("K8S_NAMESPACE", "ai-forgestream")
    job_id = str(uuid.uuid4())[:8]
    job_name = f"transcode-job-{job_id}"
    
    # Define Kubernetes Job Spec
    batch_v1 = client.BatchV1Api()
    
    # Define Container
    # We will use our custom built image: ffmpeg-forge:2.0
    container = client.V1Container(
        name="ffmpeg-worker",
        image=os.getenv("WORKER_IMAGE", "ffmpeg-forge:2.0"),
        command=[
            "python3",
            "/workspace/src/worker/processor.py",
            "--input", f"/data/{submission.input_file}",
            "--output-dir", f"/data/{submission.output_dir}",
            "--target-lufs", str(submission.target_lufs)
        ],
        volume_mounts=[
            client.V1VolumeMount(
                name="media-volume",
                mount_path="/data"
            )
        ]
    )
    
    # Define Pod Spec
    pod_spec = client.V1PodSpec(
        restart_policy="Never",
        containers=[container],
        volumes=[
            client.V1Volume(
                name="media-volume",
                persistent_volume_claim=client.V1PersistentVolumeClaimVolumeSource(
                    claim_name="media-storage"
                )
            )
        ]
    )
    
    # Define Job Spec
    job_spec = client.V1JobSpec(
        template=client.V1PodTemplateSpec(
            metadata=client.V1ObjectMeta(labels={"app": "ai-forgestream-worker", "job-id": job_id}),
            spec=pod_spec
        ),
        backoff_limit=1,
        ttl_seconds_after_finished=3600 # Auto-clean jobs after 1 hour
    )
    
    # Define Job Metadata
    job_metadata = client.V1ObjectMeta(
        name=job_name,
        namespace=namespace,
        labels={"app": "ai-forgestream-orchestrator", "job-id": job_id}
    )
    
    # Combine into full Job structure
    job = client.V1Job(
        api_version="batch/v1",
        kind="Job",
        metadata=job_metadata,
        spec=job_spec
    )
    
    try:
        api_response = batch_v1.create_namespaced_job(
            body=job,
            namespace=namespace
        )
        logger.info(f"Created K8s Job: {job_name}")
        return {
            "message": "Job submitted successfully",
            "job_name": job_name,
            "uid": api_response.metadata.uid,
            "status": "Submitted"
        }
    except Exception as e:
        logger.error(f"Failed to submit K8s Job: {e}")
        raise HTTPException(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            detail=f"Kubernetes job creation failed: {str(e)}"
        )

@app.get("/jobs/list", response_model=List[JobStatusResponse])
def list_jobs():
    if not K8S_AVAILABLE:
        raise HTTPException(
            status_code=status.HTTP_503_SERVICE_UNAVAILABLE,
            detail="Kubernetes orchestration client is not available."
        )
    
    namespace = os.getenv("K8S_NAMESPACE", "ai-forgestream")
    batch_v1 = client.BatchV1Api()
    
    try:
        jobs = batch_v1.list_namespaced_job(namespace=namespace)
        response = []
        for j in jobs.items:
            # Map statuses
            status_str = "Unknown"
            if j.status.active:
                status_str = "Running"
            elif j.status.succeeded:
                status_str = "Succeeded"
            elif j.status.failed:
                status_str = "Failed"
                
            response.append(JobStatusResponse(
                job_name=j.metadata.name,
                status=status_str,
                active=j.status.active,
                succeeded=j.status.succeeded,
                failed=j.status.failed,
                start_time=str(j.status.start_time) if j.status.start_time else None,
                completion_time=str(j.status.completion_time) if j.status.completion_time else None
            ))
        return response
    except Exception as e:
        logger.error(f"Failed to list jobs: {e}")
        raise HTTPException(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            detail=f"Failed to list jobs: {str(e)}"
        )

@app.get("/jobs/status/{job_name}", response_model=JobStatusResponse)
def get_job_status(job_name: str):
    if not K8S_AVAILABLE:
        raise HTTPException(
            status_code=status.HTTP_503_SERVICE_UNAVAILABLE,
            detail="Kubernetes orchestration client is not available."
        )
    
    namespace = os.getenv("K8S_NAMESPACE", "ai-forgestream")
    batch_v1 = client.BatchV1Api()
    
    try:
        j = batch_v1.read_namespaced_job(name=job_name, namespace=namespace)
        status_str = "Unknown"
        if j.status.active:
            status_str = "Running"
        elif j.status.succeeded:
            status_str = "Succeeded"
        elif j.status.failed:
            status_str = "Failed"
            
        return JobStatusResponse(
            job_name=j.metadata.name,
            status=status_str,
            active=j.status.active,
            succeeded=j.status.succeeded,
            failed=j.status.failed,
            start_time=str(j.status.start_time) if j.status.start_time else None,
            completion_time=str(j.status.completion_time) if j.status.completion_time else None
        )
    except client.exceptions.ApiException as e:
        if e.status == 404:
            raise HTTPException(status_code=404, detail=f"Job {job_name} not found.")
        raise HTTPException(status_code=500, detail=str(e))

@app.get("/jobs/logs/{job_name}", response_model=dict)
def get_job_logs(job_name: str):
    if not K8S_AVAILABLE:
        raise HTTPException(
            status_code=status.HTTP_503_SERVICE_UNAVAILABLE,
            detail="Kubernetes orchestration client is not available."
        )
    
    namespace = os.getenv("K8S_NAMESPACE", "ai-forgestream")
    core_v1 = client.CoreV1Api()
    
    try:
        # Find the pod associated with this job
        pods = core_v1.list_namespaced_pod(
            namespace=namespace,
            label_selector=f"job-name={job_name}"
        )
        
        if not pods.items:
            # Fallback search by job labels
            logger.warning(f"No pod found directly with job-name={job_name}")
            return {"job_name": job_name, "logs": "No pods associated with this job yet."}
            
        pod_name = pods.items[0].metadata.name
        pod_logs = core_v1.read_namespaced_pod_log(name=pod_name, namespace=namespace)
        
        return {
            "job_name": job_name,
            "pod_name": pod_name,
            "logs": pod_logs
        }
    except Exception as e:
        logger.error(f"Failed to fetch logs for job {job_name}: {e}")
        raise HTTPException(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            detail=f"Failed to fetch logs: {str(e)}"
        )

@app.delete("/jobs/{job_name}", status_code=status.HTTP_200_OK)
def delete_job(job_name: str):
    if not K8S_AVAILABLE:
        raise HTTPException(
            status_code=status.HTTP_503_SERVICE_UNAVAILABLE,
            detail="Kubernetes orchestration client is not available."
        )
    
    namespace = os.getenv("K8S_NAMESPACE", "ai-forgestream")
    batch_v1 = client.BatchV1Api()
    
    try:
        # Propagate deletion to dependent pods (cascade background deletion)
        delete_options = client.V1DeleteOptions(propagation_policy="Background")
        batch_v1.delete_namespaced_job(
            name=job_name,
            namespace=namespace,
            body=delete_options
        )
        logger.info(f"Deleted Job: {job_name}")
        return {"message": f"Job {job_name} deleted successfully"}
    except client.exceptions.ApiException as e:
        if e.status == 404:
            raise HTTPException(status_code=404, detail=f"Job {job_name} not found.")
        raise HTTPException(status_code=500, detail=str(e))
