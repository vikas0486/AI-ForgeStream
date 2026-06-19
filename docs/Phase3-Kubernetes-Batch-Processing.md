# Phase 3 – Kubernetes Batch Processing

## Objective

Run FFmpeg workloads using Kubernetes Jobs.

This phase transitions from standalone containers to orchestrated cloud-native workloads.

---

## Namespace Creation

Create isolated project environment.

```bash
kubectl apply -f k8s/namespace.yaml
```

Verify:

```bash
kubectl get ns
```

---

## FFmpeg Validation Job

File:

```text
k8s/ffmpeg-version-job.yaml
```

Purpose:

Verify Kubernetes can schedule and execute FFmpeg workloads.

---

## Deploy Job

```bash
kubectl apply -f k8s/ffmpeg-version-job.yaml
```

Verify:

```bash
kubectl get jobs -n ai-forgestream
```

Expected:

```text
Complete
```

---

## Inspect Pods

```bash
kubectl get pods -n ai-forgestream
```

Example:

```text
ffmpeg-version-768w4
```

---

## View Logs

```bash
kubectl logs -n ai-forgestream ffmpeg-version-768w4
```

Expected:

```text
ffmpeg version 6.0
```

---

## Kubernetes Job Lifecycle

```text
Job Created
    │
    ▼
Pod Scheduled
    │
    ▼
Container Started
    │
    ▼
FFmpeg Executed
    │
    ▼
Exit Code 0
    │
    ▼
Completed
```

---

## Why Kubernetes Jobs

Media processing is typically:

* Batch-oriented
* Finite duration
* Event-driven

Kubernetes Jobs provide:

* Retry logic
* Completion tracking
* Resource isolation
* Horizontal scalability

---

## Current Architecture

```text
Kubernetes Cluster
        │
        ▼
Namespace
        │
        ▼
Job
        │
        ▼
FFmpeg Container
        │
        ▼
Media Processing
```

---

## Upcoming Enhancements

* Persistent Volumes
* ConfigMaps
* Secrets
* FFmpeg Processing Jobs
* FastAPI Integration
* Terraform Provisioning

---

## Deliverables

Successfully executed FFmpeg workloads inside Kubernetes using batch processing patterns.

This phase establishes the orchestration foundation for cloud-native media platforms.
