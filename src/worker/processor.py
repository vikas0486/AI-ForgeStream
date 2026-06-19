#!/usr/bin/env python3
import os
import sys
import json
import subprocess
import argparse
import time
import re

def run_cmd(cmd, description="Running command"):
    print(f"[{description}] Executing: {' '.join(cmd)}")
    start_time = time.time()
    result = subprocess.run(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
    duration = time.time() - start_time
    if result.returncode != 0:
        print(f"[{description}] FAILED (Exit Code {result.returncode})")
        print(f"Stdout:\n{result.stdout}")
        print(f"Stderr:\n{result.stderr}")
        raise RuntimeError(f"Command failed: {description}")
    print(f"[{description}] Completed in {duration:.2f} seconds")
    return result.stdout, result.stderr

def inspect_media(input_path):
    print(f"\n--- Step 1: Inspecting Media Metadata ({input_path}) ---")
    cmd = [
        "ffprobe",
        "-v", "quiet",
        "-print_format", "json",
        "-show_format",
        "-show_streams",
        input_path
    ]
    stdout, _ = run_cmd(cmd, "ffprobe inspect")
    return json.loads(stdout)

def run_loudness_analysis(input_path, target_lufs=-24.0):
    print(f"\n--- Step 2: Measuring Loudness (Pass 1 of BS.1770-4 / EBU R128) ---")
    cmd = [
        "ffmpeg",
        "-i", input_path,
        "-af", f"loudnorm=I={target_lufs}:TP=-2.0:LRA=7.0:print_format=json",
        "-f", "null",
        "-"
    ]
    _, stderr = run_cmd(cmd, "ffmpeg loudnorm measure")
    
    json_match = re.search(r"\{\s*\"input_i\".*?\}", stderr, re.DOTALL)
    if not json_match:
        json_match = re.search(r"\{\s*'input_i'.*?\}", stderr, re.DOTALL)
        if not json_match:
            print("Warning: Could not parse loudnorm measurement JSON from stderr. Stderr output:")
            print(stderr)
            raise RuntimeError("Loudness measurement failed.")
            
    loudness_data = json.loads(json_match.group(0))
    print(f"Measured Input Loudness Data: {json.dumps(loudness_data, indent=2)}")
    return loudness_data

def normalize_audio(input_path, output_path, loudness_data, target_lufs=-24.0):
    print(f"\n--- Step 3: Loudness Normalization & Resampling (Pass 2 of BS.1770-4) ---")
    cmd = [
        "ffmpeg",
        "-y",
        "-i", input_path,
        "-af", (
            f"loudnorm=I={target_lufs}:TP=-2.0:LRA=7.0:"
            f"measured_I={loudness_data['input_i']}:"
            f"measured_TP={loudness_data['input_tp']}:"
            f"measured_LRA={loudness_data['input_lra']}:"
            f"measured_thresh={loudness_data['input_thresh']}:"
            f"offset={loudness_data['target_offset']}:"
            f"linear=true"
        ),
        "-ar", "48000",
        "-ac", "2",
        output_path
    ]
    run_cmd(cmd, "ffmpeg loudness normalize")
    print(f"Normalized audio saved to {output_path}")

def transcode_hls_renditions(video_input, audio_input, output_dir):
    print(f"\n--- Step 4: Transcoding Multi-Bitrate renditions & Packaging HLS ---")
    renditions = [
        {"name": "1080p", "width": 1920, "height": 1080, "bitrate": "4500k", "profile": "high"},
        {"name": "720p", "width": 1280, "height": 720, "bitrate": "2200k", "profile": "main"},
        {"name": "480p", "width": 854, "height": 480, "bitrate": "800k", "profile": "baseline"}
    ]
    
    os.makedirs(output_dir, exist_ok=True)
    
    for r in renditions:
        r_dir = os.path.join(output_dir, r["name"])
        os.makedirs(r_dir, exist_ok=True)
        
        print(f"\nProcessing Rendition: {r['name']} ({r['width']}x{r['height']} @ {r['bitrate']})")
        cmd = [
            "ffmpeg",
            "-y",
            "-i", video_input,
            "-i", audio_input,
            "-map", "0:v:0",
            "-map", "1:a:0",
            "-vf", f"scale=w={r['width']}:h={r['height']}",
            "-c:v", "libx264",
            "-b:v", r["bitrate"],
            "-maxrate:v", str(int(int(r["bitrate"][:-1]) * 1.3)) + "k",
            "-bufsize:v", str(int(int(r["bitrate"][:-1]) * 2)) + "k",
            "-profile:v", r["profile"],
            "-g", "60",
            "-keyint_min", "60",
            "-sc_threshold", "0",
            "-c:a", "aac",
            "-b:a", "128k",
            "-f", "hls",
            "-hls_time", "6",
            "-hls_playlist_type", "vod",
            "-hls_segment_filename", os.path.join(r_dir, "segment_%03d.ts"),
            os.path.join(r_dir, "playlist.m3u8")
        ]
        run_cmd(cmd, f"ffmpeg transcode {r['name']}")
    
    master_playlist_path = os.path.join(output_dir, "master.m3u8")
    with open(master_playlist_path, "w") as f:
        f.write("#EXTM3U\n")
        f.write("#EXT-X-VERSION:3\n\n")
        
        f.write("#EXT-X-STREAM-INF:BANDWIDTH=4800000,RESOLUTION=1920x1080,CODECS=\"avc1.64002a,mp4a.40.2\"\n")
        f.write("1080p/playlist.m3u8\n\n")
        
        f.write("#EXT-X-STREAM-INF:BANDWIDTH=2400000,RESOLUTION=1280x720,CODECS=\"avc1.4d401f,mp4a.40.2\"\n")
        f.write("720p/playlist.m3u8\n\n")
        
        f.write("#EXT-X-STREAM-INF:BANDWIDTH=900000,RESOLUTION=854x480,CODECS=\"avc1.42c01e,mp4a.40.2\"\n")
        f.write("480p/playlist.m3u8\n")
        
    print(f"\nHLS Master Playlist written to {master_playlist_path}")

def generate_report(input_path, output_dir, metadata, loudness_data, start_time):
    print(f"\n--- Step 5: Generating System Report & Metrics ---")
    duration = time.time() - start_time
    
    report = {
        "status": "COMPLETED",
        "job_metrics": {
            "processing_time_sec": round(duration, 2),
            "input_file": input_path,
            "output_dir": output_dir,
            "pipeline_stages": ["inspection", "loudness_analysis", "normalization", "abr_transcoding", "hls_packaging"]
        },
        "media_metadata": {
            "format": metadata.get("format", {}).get("format_long_name", "unknown"),
            "duration_sec": float(metadata.get("format", {}).get("duration", 0)),
            "bitrate_bps": int(metadata.get("format", {}).get("size", 0)) * 8 / max(1.0, float(metadata.get("format", {}).get("duration", 1))),
            "streams_found": len(metadata.get("streams", []))
        },
        "loudness_metrics": {
            "compliance_standard": "ITU-R BS.1770-4 / EBU R128",
            "target_loudness_lufs": -24.0,
            "measured_integrated_lufs": float(loudness_data.get("input_i", 0)),
            "measured_true_peak_dbtp": float(loudness_data.get("input_tp", 0)),
            "measured_lra_lu": float(loudness_data.get("input_lra", 0)),
            "applied_gain_db": float(loudness_data.get("target_offset", 0))
        }
    }
    
    report_path = os.path.join(output_dir, "metrics.json")
    with open(report_path, "w") as f:
        json.dump(report, f, indent=4)
    print(f"System Report saved to {report_path}")
    print(json.dumps(report, indent=2))

def main():
    parser = argparse.ArgumentParser(description="AI-ForgeStream Media Transcoding & Audio Loudness Normalization Pipeline")
    parser.add_argument("--input", required=True, help="Path to input video file")
    parser.add_argument("--output-dir", required=True, help="Directory to save transcoded HLS outputs")
    parser.add_argument("--target-lufs", type=float, default=-24.0, help="Target audio loudness in LUFS")
    
    args = parser.parse_args()
    
    start_time = time.time()
    
    if not os.path.exists(args.input):
        print(f"Error: Input file '{args.input}' does not exist.")
        sys.exit(1)
        
    os.makedirs(args.output_dir, exist_ok=True)
    
    temp_audio_norm = os.path.join(args.output_dir, "temp_normalized_audio.aac")
    
    try:
        metadata = inspect_media(args.input)
        loudness_data = run_loudness_analysis(args.input, args.target_lufs)
        normalize_audio(args.input, temp_audio_norm, loudness_data, args.target_lufs)
        transcode_hls_renditions(args.input, temp_audio_norm, args.output_dir)
        generate_report(args.input, args.output_dir, metadata, loudness_data, start_time)
        
    finally:
        if os.path.exists(temp_audio_norm):
            os.remove(temp_audio_norm)
            
    print("\n--- Pipeline Completed Successfully ---")

if __name__ == "__main__":
    main()
