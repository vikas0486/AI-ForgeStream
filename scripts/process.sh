#!/bin/sh

set -e

echo "Extracting Audio..."

ffmpeg \
-i samples/input.mp4 \
outputs/audio.wav

echo "Normalizing Audio..."

ffmpeg \
-i outputs/audio.wav \
-af loudnorm \
outputs/normalized.wav

echo "Creating Enhanced Video..."

ffmpeg \
-i samples/input.mp4 \
-i outputs/normalized.wav \
-c:v copy \
-map 0:v:0 \
-map 1:a:0 \
outputs/enhanced.mp4

echo "Done"
