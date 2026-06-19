# Phase 1 – FFmpeg Fundamentals

## Objective

Learn the foundations of media processing using FFmpeg.

This phase focuses on understanding how media files are structured and how audio/video streams can be manipulated programmatically.

---

## Topics Covered

* Media inspection
* Codecs
* Containers
* Audio extraction
* Audio normalization
* Remuxing

---

## Media Inspection

```bash
ffprobe samples/input.mp4
```

Purpose:

* Identify codecs
* Inspect metadata
* Understand stream structure

---

## Audio Extraction

```bash
ffmpeg \
-i samples/input.mp4 \
outputs/audio.wav
```

Workflow:

Input MP4

↓

Demux Audio Stream

↓

Generate WAV

---

## Audio Normalization

```bash
ffmpeg \
-i outputs/audio.wav \
-af loudnorm \
outputs/normalized.wav
```

Purpose:

Normalize audio loudness for consistent playback.

---

## Remuxing

```bash
ffmpeg \
-i samples/input.mp4 \
-i outputs/normalized.wav \
-c:v copy \
-map 0:v:0 \
-map 1:a:0 \
outputs/enhanced.mp4
```

Purpose:

Replace audio track without re-encoding video.

---

## Key Concepts Learned

* Codec
* Container
* Demuxing
* Decoding
* Encoding
* Muxing
* Remuxing
* Audio normalization

---

## Deliverables

Generated:

* audio.wav
* normalized.wav
* enhanced.mp4

Phase 1 establishes the media processing foundation for subsequent cloud-native deployment phases.