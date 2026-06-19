# Phase 2 – Docker Containerization

## Objective

Package FFmpeg processing workloads into portable and reproducible containers.

---

## Why Containerization

Traditional media workflows often depend on local software installations.

Containers provide:

* Portability
* Consistency
* Reproducibility
* Cloud readiness

---

## Dockerfile

```dockerfile
FROM jrottenberg/ffmpeg:6.0-alpine

WORKDIR /workspace

ENTRYPOINT []
CMD ["sh"]
```

---

## Build Image

```bash
docker build -t ffmpeg-forge:1.0 docker/
```

---

## Run Interactive Container

```bash
docker run -it \
-v $(pwd):/workspace \
ffmpeg-forge:1.0
```

---

## Validate FFmpeg

```bash
which ffmpeg
```

Expected:

```text
/usr/local/bin/ffmpeg
```

---

## Media Processing Inside Container

Audio Extraction:

```bash
ffmpeg \
-i samples/input.mp4 \
outputs/docker_audio.wav
```

Audio Normalization:

```bash
ffmpeg \
-i outputs/docker_audio.wav \
-af loudnorm \
outputs/docker_normalized.wav
```

---

## Architecture

```text
Input Media
     │
     ▼
Docker Container
     │
     ▼
FFmpeg Runtime
     │
     ▼
Processed Media
```

---

## Key Concepts Learned

* Docker Images
* Containers
* Bind Mounts
* Container Runtime
* Reproducible Media Processing

---

## Deliverables

Generated:

* docker_audio.wav
* docker_normalized.wav

This phase demonstrates containerized media processing workloads suitable for Kubernetes deployment.