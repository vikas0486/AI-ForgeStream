# AI-ForgeStream
## Project Vision

AI-ForgeStream aims to bridge traditional OTT engineering expertise with modern cloud-native platform engineering practices.

The long-term goal is to evolve from local FFmpeg processing into a Kubernetes-native media processing platform capable of supporting AI-enhanced workflows, scalable batch processing, and production-grade media services.


## Overview

AI-ForgeStream is a hands-on learning project designed to bridge traditional OTT media workflows with modern cloud-native platform engineering practices.

This repository demonstrates how media processing workloads can be containerized and eventually orchestrated using Kubernetes.

The project focuses on understanding the foundational concepts behind media processing pipelines that power modern streaming platforms.

---

## Objectives

* Learn FFmpeg fundamentals through practical examples.
* Reconnect OTT domain knowledge with cloud-native technologies.
* Build containerized media processing pipelines.
* Prepare for Cloud Architect roles in media organizations such as Dolby.
* Create a foundation for future AI-enhanced media workflows.

## Why This Project Exists

With prior experience in OTT platforms and recent experience in CloudOps, DevOps, and SRE, this project was created to reconnect deep media domain knowledge with modern cloud-native engineering practices.

It serves as both a personal learning initiative and a practical demonstration of cloud architecture skills relevant to next-generation media platforms.

---

# Architecture

```
Input MP4
    │
    ▼
FFmpeg Media Worker
    │
    ├── Audio Extraction
    │
    ├── Audio Normalization
    │
    └── Remuxing
    │
    ▼
Enhanced Media Output
```

## Target Architecture

```text
              Upload API
                   │
                   ▼
          Kubernetes Job Trigger
                   │
                   ▼
          FFmpeg Processing Pods
                   │
          ┌────────┴─────────┐
          ▼                  ▼
   Audio Enhancement   Video Processing
          │                  │
          └────────┬─────────┘
                   ▼
            Processed Assets
                   │
                   ▼
            CDN / Distribution
```

---

# Current Repository Structure

```
AI-ForgeStream/
│
├── docker/
│   └── Dockerfile
│
├── samples/
│   └── input.mp4
│
├── outputs/
│   ├── audio.wav
│   ├── normalized.wav
│   ├── enhanced.mp4
│   ├── docker_audio.wav
│   └── docker_normalized.wav
│
├── docs/
│
├── k8s/
│
├── Commands.sh
│
└── README.md
```

---

# Technologies Used

| Technology | Purpose                       |
| ---------- | ----------------------------- |
| FFmpeg     | Media processing              |
| Docker     | Containerization              |
| Kubernetes | Future orchestration          |
| GitHub     | Source control                |
| macOS      | Local development environment |

---

# Prerequisites

Install the following:

## Docker Desktop

Verify installation:

```bash
docker version
```

---

## FFmpeg

Verify installation:

```bash
ffmpeg -version
```

---

## kubectl (Phase 2)

Verify installation:

```bash
kubectl version --client
```

---

# Phase 1 – Local FFmpeg Training

---

## Inspect Media

```bash
ffprobe samples/input.mp4
```

Purpose:

* Understand codecs.
* Identify video streams.
* Identify audio streams.

Example Output:

```
Video → H.264

Audio → AAC
```

---

## Extract Audio

Command:

```bash
ffmpeg \
-i samples/input.mp4 \
outputs/audio.wav
```

Workflow:

```
MP4
 │
 ├── Video
 │
 └── Audio
        │
        ▼
      WAV
```

Purpose:

Convert compressed AAC audio into an uncompressed WAV format suitable for processing.

---

## Normalize Audio

Command:

```bash
ffmpeg \
-i outputs/audio.wav \
-af loudnorm \
outputs/normalized.wav
```

Workflow:

```
Input Audio
      │
      ▼
 Loudness Analysis
      │
      ▼
Normalized Output
```

Purpose:

Improve consistency of audio levels.

---

## Remux Enhanced Audio

Command:

```bash
ffmpeg \
-i samples/input.mp4 \
-i outputs/normalized.wav \
-c:v copy \
-map 0:v:0 \
-map 1:a:0 \
outputs/enhanced.mp4
```

Workflow:

```
Original Video
        │
        ▼
Replace Audio Track
        │
        ▼
Enhanced MP4
```

Purpose:

Combine processed audio with the original video stream.

---

# Phase 2 – Dockerized Media Processing

---

## Dockerfile

Location:

```
docker/Dockerfile
```

Contents:

```dockerfile
FROM jrottenberg/ffmpeg:6.0-alpine

WORKDIR /workspace

ENTRYPOINT []
CMD ["sh"]
```

Purpose:

Create an interactive FFmpeg runtime environment.

---

## Build Docker Image

Command:

```bash
docker build -t ffmpeg-forge:1.0 docker/
```

Verify:

```bash
docker images
```

Expected:

```
ffmpeg-forge    1.0
```

---

## Launch Container

Command:

```bash
docker run -it \
-v $(pwd):/workspace \
ffmpeg-forge:1.0
```

Purpose:

Mount the local project directory into the container.

---

## Verify Environment

Inside the container:

```bash
ls
```

Expected:

```
docker
docs
k8s
outputs
samples
README.md
```

---

Verify FFmpeg:

```bash
which ffmpeg
```

Expected:

```
/usr/local/bin/ffmpeg
```

---

# Containerized Audio Extraction

Inside the container:

```bash
ffmpeg \
-i samples/input.mp4 \
outputs/docker_audio.wav
```

Purpose:

Execute media processing entirely within Docker.

---

# Containerized Audio Normalization

Inside the container:

```bash
ffmpeg \
-i outputs/docker_audio.wav \
-af loudnorm \
outputs/docker_normalized.wav
```

Purpose:

Apply loudness normalization inside the containerized runtime.

---

# Verify Outputs

Inside the container:

```bash
ls outputs
```

Expected:

```
audio.wav
docker_audio.wav
enhanced.mp4
normalized.wav
docker_normalized.wav
```

---

# Key Concepts Learned

## Codec

Algorithm used to compress and decompress media.

Examples:

* H.264
* H.265
* AAC

---

## Demuxing

Separating audio and video streams.

---

## Decoding

Converting compressed media into raw data.

---

## Loudness Normalization

Balancing audio levels for a better listening experience.

---

## Remuxing

Replacing or combining streams without re-encoding video.

---

## Containerization

Packaging media workloads into portable environments.

---

# Why This Matters

Modern media organizations increasingly rely on containerized processing pipelines.

This project demonstrates:

* Practical FFmpeg knowledge.
* Media workflow understanding.
* Docker fundamentals.
* Platform engineering principles.

---

# Future Roadmap

## Phase 3

Kubernetes-based FFmpeg Jobs.

```
Input Video
      │
      ▼
Kubernetes Job
      │
      ▼
FFmpeg Pod
      │
      ▼
Processed Output
```

---

## Phase 4

FastAPI Upload Service.

```
Upload
   │
   ▼
API
   │
   ▼
Kubernetes Job
```

---

## Phase 5

Terraform Infrastructure.

Provision:

* Namespaces
* Persistent Volumes
* RBAC
* Jobs

---

## Phase 6

AI-Enhanced Media Processing.

Potential integrations:

* Noise reduction.
* Speech enhancement.
* Subtitle generation.
* Content intelligence.

---

# Lessons Learned

This project reinforced the relationship between traditional OTT concepts and modern cloud-native architectures.

The same media fundamentals continue to exist, but the execution environments have evolved:

```
Broadcast Systems
        ↓
Virtual Machines
        ↓
Containers
        ↓
Kubernetes
        ↓
AI-Augmented Media Platforms
```

---

# Author

Vikash Jaiswal

Cloud Architect | Platform Engineer | DevOps | SRE

Building bridges between OTT media systems and cloud-native platforms.