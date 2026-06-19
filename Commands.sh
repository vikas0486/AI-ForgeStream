vikash@Vikashs-MacBook-Pro AI-ForgeStream % ffprobe samples/input.mp4
ffprobe version 8.1.1 Copyright (c) 2007-2026 the FFmpeg developers
  built with Apple clang version 16.0.0 (clang-1600.0.26.6)
  configuration: --prefix=/usr/local/Cellar/ffmpeg/8.1.1 --enable-shared --enable-pthreads --enable-version3 --cc=clang --host-cflags= --host-ldflags= --enable-ffplay --enable-gpl --enable-libsvtav1 --enable-libopus --enable-libx264 --enable-libmp3lame --enable-libdav1d --enable-libvmaf --enable-libvpx --enable-libx265 --enable-openssl --enable-videotoolbox --enable-audiotoolbox
  libavutil      60. 26.101 / 60. 26.101
  libavcodec     62. 28.101 / 62. 28.101
  libavformat    62. 12.101 / 62. 12.101
  libavdevice    62.  3.101 / 62.  3.101
  libavfilter    11. 14.101 / 11. 14.101
  libswscale      9.  5.101 /  9.  5.101
  libswresample   6.  3.101 /  6.  3.101
Input #0, mov,mp4,m4a,3gp,3g2,mj2, from 'samples/input.mp4':
  Metadata:
    major_brand     : isom
    minor_version   : 512
    compatible_brands: isomiso2avc1mp41
    encoder         : Lavf58.29.100
  Duration: 00:01:00.14, start: 0.000000, bitrate: 2152 kb/s
  Stream #0:0[0x1](und): Video: h264 (High) (avc1 / 0x31637661), yuv420p(tv, bt709, progressive), 1920x1080 [SAR 1:1 DAR 16:9], 2020 kb/s, 25.02 fps, 25 tbr, 90k tbn (default)
    Metadata:
      handler_name    : VideoHandler
  Stream #0:1[0x2](und): Audio: aac (LC) (mp4a / 0x6134706D), 44100 Hz, stereo, fltp, 128 kb/s (default)
    Metadata:
      handler_name    : SoundHandler


vikash@Vikashs-MacBook-Pro AI-ForgeStream % ffmpeg -i samples/input.mp4 outputs/audio.wav 
ffmpeg version 8.1.1 Copyright (c) 2000-2026 the FFmpeg developers
  built with Apple clang version 16.0.0 (clang-1600.0.26.6)
  configuration: --prefix=/usr/local/Cellar/ffmpeg/8.1.1 --enable-shared --enable-pthreads --enable-version3 --cc=clang --host-cflags= --host-ldflags= --enable-ffplay --enable-gpl --enable-libsvtav1 --enable-libopus --enable-libx264 --enable-libmp3lame --enable-libdav1d --enable-libvmaf --enable-libvpx --enable-libx265 --enable-openssl --enable-videotoolbox --enable-audiotoolbox
  libavutil      60. 26.101 / 60. 26.101
  libavcodec     62. 28.101 / 62. 28.101
  libavformat    62. 12.101 / 62. 12.101
  libavdevice    62.  3.101 / 62.  3.101
  libavfilter    11. 14.101 / 11. 14.101
  libswscale      9.  5.101 /  9.  5.101
  libswresample   6.  3.101 /  6.  3.101
Input #0, mov,mp4,m4a,3gp,3g2,mj2, from 'samples/input.mp4':
  Metadata:
    major_brand     : isom
    minor_version   : 512
    compatible_brands: isomiso2avc1mp41
    encoder         : Lavf58.29.100
  Duration: 00:01:00.14, start: 0.000000, bitrate: 2152 kb/s
  Stream #0:0[0x1](und): Video: h264 (High) (avc1 / 0x31637661), yuv420p(tv, bt709, progressive), 1920x1080 [SAR 1:1 DAR 16:9], 2020 kb/s, 25.02 fps, 25 tbr, 90k tbn (default)
    Metadata:
      handler_name    : VideoHandler
  Stream #0:1[0x2](und): Audio: aac (LC) (mp4a / 0x6134706D), 44100 Hz, stereo, fltp, 128 kb/s (default)
    Metadata:
      handler_name    : SoundHandler
Stream mapping:
  Stream #0:1 -> #0:0 (aac (native) -> pcm_s16le (native))
Press [q] to stop, [?] for help
Output #0, wav, to 'outputs/audio.wav':
  Metadata:
    major_brand     : isom
    minor_version   : 512
    compatible_brands: isomiso2avc1mp41
    ISFT            : Lavf62.12.101
  Stream #0:0(und): Audio: pcm_s16le ([1][0][0][0] / 0x0001), 44100 Hz, stereo, s16, 1411 kb/s (default)
    Metadata:
      encoder         : Lavc62.28.101 pcm_s16le
      handler_name    : SoundHandler
[out#0/wav @ 0x7fd6fd107d80] video:0KiB audio:10360KiB subtitle:0KiB other streams:0KiB global headers:0KiB muxing overhead: 0.000735%
size=   10360KiB time=00:01:00.13 bitrate=1411.2kbits/s speed= 801x elapsed=0:00:00.07   


vikash@Vikashs-MacBook-Pro AI-ForgeStream % ffmpeg -i outputs/audio.wav -af loudnorm outputs/normalized.wav 
ffmpeg version 8.1.1 Copyright (c) 2000-2026 the FFmpeg developers
  built with Apple clang version 16.0.0 (clang-1600.0.26.6)
  configuration: --prefix=/usr/local/Cellar/ffmpeg/8.1.1 --enable-shared --enable-pthreads --enable-version3 --cc=clang --host-cflags= --host-ldflags= --enable-ffplay --enable-gpl --enable-libsvtav1 --enable-libopus --enable-libx264 --enable-libmp3lame --enable-libdav1d --enable-libvmaf --enable-libvpx --enable-libx265 --enable-openssl --enable-videotoolbox --enable-audiotoolbox
  libavutil      60. 26.101 / 60. 26.101
  libavcodec     62. 28.101 / 62. 28.101
  libavformat    62. 12.101 / 62. 12.101
  libavdevice    62.  3.101 / 62.  3.101
  libavfilter    11. 14.101 / 11. 14.101
  libswscale      9.  5.101 /  9.  5.101
  libswresample   6.  3.101 /  6.  3.101
[aist#0:0/pcm_s16le @ 0x7fe732807280] Guessed Channel Layout: stereo
Input #0, wav, from 'outputs/audio.wav':
  Metadata:
    encoder         : Lavf62.12.101
  Duration: 00:01:00.14, bitrate: 1411 kb/s
  Stream #0:0: Audio: pcm_s16le ([1][0][0][0] / 0x0001), 44100 Hz, stereo, s16, 1411 kb/s
Stream mapping:
  Stream #0:0 -> #0:0 (pcm_s16le (native) -> pcm_s16le (native))
Press [q] to stop, [?] for help
Output #0, wav, to 'outputs/normalized.wav':
  Metadata:
    ISFT            : Lavf62.12.101
  Stream #0:0: Audio: pcm_s16le ([1][0][0][0] / 0x0001), 192000 Hz, stereo, s16, 6144 kb/s
    Metadata:
      encoder         : Lavc62.28.101 pcm_s16le
[out#0/wav @ 0x7fe732808f00] video:0KiB audio:45105KiB subtitle:0KiB other streams:0KiB global headers:0KiB muxing overhead: 0.000221%
size=   45105KiB time=00:01:00.20 bitrate=6137.9kbits/s speed=28.1x elapsed=0:00:02.13    


vikash@Vikashs-MacBook-Pro AI-ForgeStream % ffprobe outputs/audio.wav 
ffprobe version 8.1.1 Copyright (c) 2007-2026 the FFmpeg developers
  built with Apple clang version 16.0.0 (clang-1600.0.26.6)
  configuration: --prefix=/usr/local/Cellar/ffmpeg/8.1.1 --enable-shared --enable-pthreads --enable-version3 --cc=clang --host-cflags= --host-ldflags= --enable-ffplay --enable-gpl --enable-libsvtav1 --enable-libopus --enable-libx264 --enable-libmp3lame --enable-libdav1d --enable-libvmaf --enable-libvpx --enable-libx265 --enable-openssl --enable-videotoolbox --enable-audiotoolbox
  libavutil      60. 26.101 / 60. 26.101
  libavcodec     62. 28.101 / 62. 28.101
  libavformat    62. 12.101 / 62. 12.101
  libavdevice    62.  3.101 / 62.  3.101
  libavfilter    11. 14.101 / 11. 14.101
  libswscale      9.  5.101 /  9.  5.101
  libswresample   6.  3.101 /  6.  3.101
Input #0, wav, from 'outputs/audio.wav':
  Metadata:
    encoder         : Lavf62.12.101
  Duration: 00:01:00.14, bitrate: 1411 kb/s
  Stream #0:0: Audio: pcm_s16le ([1][0][0][0] / 0x0001), 44100 Hz, 2 channels, s16, 1411 kb/s


vikash@Vikashs-MacBook-Pro AI-ForgeStream % ffprobe outputs/normalized.wav 
ffprobe version 8.1.1 Copyright (c) 2007-2026 the FFmpeg developers
  built with Apple clang version 16.0.0 (clang-1600.0.26.6)
  configuration: --prefix=/usr/local/Cellar/ffmpeg/8.1.1 --enable-shared --enable-pthreads --enable-version3 --cc=clang --host-cflags= --host-ldflags= --enable-ffplay --enable-gpl --enable-libsvtav1 --enable-libopus --enable-libx264 --enable-libmp3lame --enable-libdav1d --enable-libvmaf --enable-libvpx --enable-libx265 --enable-openssl --enable-videotoolbox --enable-audiotoolbox
  libavutil      60. 26.101 / 60. 26.101
  libavcodec     62. 28.101 / 62. 28.101
  libavformat    62. 12.101 / 62. 12.101
  libavdevice    62.  3.101 / 62.  3.101
  libavfilter    11. 14.101 / 11. 14.101
  libswscale      9.  5.101 /  9.  5.101
  libswresample   6.  3.101 /  6.  3.101
Input #0, wav, from 'outputs/normalized.wav':
  Metadata:
    encoder         : Lavf62.12.101
  Duration: 00:01:00.14, bitrate: 6144 kb/s
  Stream #0:0: Audio: pcm_s16le ([1][0][0][0] / 0x0001), 192000 Hz, stereo, s16, 6144 kb/s


vikash@Vikashs-MacBook-Pro AI-ForgeStream % ffmpeg -i samples/input.mp4 -i outputs/normalized.wav -c:v copy -map 0:v:0 -map 1:a:0 outputs/enhanced.mp4 
ffmpeg version 8.1.1 Copyright (c) 2000-2026 the FFmpeg developers
  built with Apple clang version 16.0.0 (clang-1600.0.26.6)
  configuration: --prefix=/usr/local/Cellar/ffmpeg/8.1.1 --enable-shared --enable-pthreads --enable-version3 --cc=clang --host-cflags= --host-ldflags= --enable-ffplay --enable-gpl --enable-libsvtav1 --enable-libopus --enable-libx264 --enable-libmp3lame --enable-libdav1d --enable-libvmaf --enable-libvpx --enable-libx265 --enable-openssl --enable-videotoolbox --enable-audiotoolbox
  libavutil      60. 26.101 / 60. 26.101
  libavcodec     62. 28.101 / 62. 28.101
  libavformat    62. 12.101 / 62. 12.101
  libavdevice    62.  3.101 / 62.  3.101
  libavfilter    11. 14.101 / 11. 14.101
  libswscale      9.  5.101 /  9.  5.101
  libswresample   6.  3.101 /  6.  3.101
Input #0, mov,mp4,m4a,3gp,3g2,mj2, from 'samples/input.mp4':
  Metadata:
    major_brand     : isom
    minor_version   : 512
    compatible_brands: isomiso2avc1mp41
    encoder         : Lavf58.29.100
  Duration: 00:01:00.14, start: 0.000000, bitrate: 2152 kb/s
  Stream #0:0[0x1](und): Video: h264 (High) (avc1 / 0x31637661), yuv420p(tv, bt709, progressive), 1920x1080 [SAR 1:1 DAR 16:9], 2020 kb/s, 25.02 fps, 25 tbr, 90k tbn (default)
    Metadata:
      handler_name    : VideoHandler
  Stream #0:1[0x2](und): Audio: aac (LC) (mp4a / 0x6134706D), 44100 Hz, stereo, fltp, 128 kb/s (default)
    Metadata:
      handler_name    : SoundHandler
Input #1, wav, from 'outputs/normalized.wav':
  Metadata:
    encoder         : Lavf62.12.101
  Duration: 00:01:00.14, bitrate: 6144 kb/s
  Stream #1:0: Audio: pcm_s16le ([1][0][0][0] / 0x0001), 192000 Hz, stereo, s16, 6144 kb/s
Stream mapping:
  Stream #0:0 -> #0:0 (copy)
  Stream #1:0 -> #0:1 (pcm_s16le (native) -> aac (native))
Press [q] to stop, [?] for help
Output #0, mp4, to 'outputs/enhanced.mp4':
  Metadata:
    major_brand     : isom
    minor_version   : 512
    compatible_brands: isomiso2avc1mp41
    encoder         : Lavf62.12.101
  Stream #0:0(und): Video: h264 (High) (avc1 / 0x31637661), yuv420p(tv, bt709, progressive), 1920x1080 [SAR 1:1 DAR 16:9], q=2-31, 2020 kb/s, 25.02 fps, 25 tbr, 90k tbn (default)
    Metadata:
      handler_name    : VideoHandler
  Stream #0:1: Audio: aac (LC) (mp4a / 0x6134706D), 96000 Hz, stereo, fltp, 128 kb/s
    Metadata:
      encoder         : Lavc62.28.101 aac
[out#0/mp4 @ 0x7f82e52087c0] video:14814KiB audio:952KiB subtitle:0KiB other streams:0KiB global headers:0KiB muxing overhead: 0.395762%
frame= 1503 fps=1269 q=-1.0 Lsize=   15828KiB time=00:01:00.03 bitrate=2159.9kbits/s speed=50.7x elapsed=0:00:01.18    
[aac @ 0x7f82e5216940] Qavg: 713.599

vikash@Vikashs-MacBook-Pro AI-ForgeStream % ffmpeg -version
ffmpeg version 8.1.1 Copyright (c) 2000-2026 the FFmpeg developers
built with Apple clang version 16.0.0 (clang-1600.0.26.6)
configuration: --prefix=/usr/local/Cellar/ffmpeg/8.1.1 --enable-shared --enable-pthreads --enable-version3 --cc=clang --host-cflags= --host-ldflags= --enable-ffplay --enable-gpl --enable-libsvtav1 --enable-libopus --enable-libx264 --enable-libmp3lame --enable-libdav1d --enable-libvmaf --enable-libvpx --enable-libx265 --enable-openssl --enable-videotoolbox --enable-audiotoolbox
libavutil      60. 26.101 / 60. 26.101
libavcodec     62. 28.101 / 62. 28.101
libavformat    62. 12.101 / 62. 12.101
libavdevice    62.  3.101 / 62.  3.101
libavfilter    11. 14.101 / 11. 14.101
libswscale      9.  5.101 /  9.  5.101
libswresample   6.  3.101 /  6.  3.101

Exiting with exit code 0

## Containarization with Docker
vikash@Vikashs-MacBook-Pro AI-ForgeStream % code docker/Dockerfile 
vikash@Vikashs-MacBook-Pro AI-ForgeStream % cat docker/Dockerfile
FROM jrottenberg/ffmpeg:6.0-alpine

WORKDIR /workspace

ENTRYPOINT []
CMD ["sh"]         

vikash@Vikashs-MacBook-Pro AI-ForgeStream % docker build -t ffmpeg-forge:1.0 docker/                                   
[+] Building 3.0s (7/7) FINISHED                                                                                                                                                                                         docker:desktop-linux
 => [internal] load build definition from Dockerfile                                                                                                                                                                                     0.0s
 => => transferring dockerfile: 117B                                                                                                                                                                                                     0.0s
 => [internal] load metadata for docker.io/jrottenberg/ffmpeg:6.0-alpine                                                                                                                                                                 2.8s
 => [auth] jrottenberg/ffmpeg:pull token for registry-1.docker.io                                                                                                                                                                        0.0s
 => [internal] load .dockerignore                                                                                                                                                                                                        0.0s
 => => transferring context: 2B                                                                                                                                                                                                          0.0s
 => [1/2] FROM docker.io/jrottenberg/ffmpeg:6.0-alpine@sha256:ea1e3fe129de112b890bcb08fc0795cec29d63cd3b194eb46a2e55adc785e274                                                                                                           0.0s
 => => resolve docker.io/jrottenberg/ffmpeg:6.0-alpine@sha256:ea1e3fe129de112b890bcb08fc0795cec29d63cd3b194eb46a2e55adc785e274                                                                                                           0.0s
 => CACHED [2/2] WORKDIR /workspace                                                                                                                                                                                                      0.0s
 => exporting to image                                                                                                                                                                                                                   0.1s
 => => exporting layers                                                                                                                                                                                                                  0.0s
 => => exporting manifest sha256:7419effed43000c067e0d09e18ad4737c36038d76c101c06a339d20b93382d64                                                                                                                                        0.0s
 => => exporting config sha256:a5329eef50e6426629453876d871e44e79faa2d1569c8e4d414f8c10acb993d6                                                                                                                                          0.0s
 => => exporting attestation manifest sha256:a54138b38315e273f2ed9870e63088148184383f0ec6906fa59ed17ee080c5eb                                                                                                                            0.0s
 => => exporting manifest list sha256:0523b2a55ef8697ee4f2c6b678d1c6d4ce31b1060aa9cc48bba730b13e389398                                                                                                                                   0.0s
 => => naming to docker.io/library/ffmpeg-forge:1.0                                                                                                                                                                                      0.0s
 => => unpacking to docker.io/library/ffmpeg-forge:1.0                                                                                                                                                                                   0.0s

View build details: docker-desktop://dashboard/build/desktop-linux/desktop-linux/1zv2q203f2xiffbp6oyfd8nmt
vikash@Vikashs-MacBook-Pro AI-ForgeStream % docker image inspect ffmpeg-forge:1.0 | grep -A 5 Entrypoint
vikash@Vikashs-MacBook-Pro AI-ForgeStream % docker run -it -v $(pwd):/workspace ffmpeg-forge:1.0                                               
/workspace # ls
Commands.sh  docker       docs         k8s          outputs      samples
/workspace # which ffmpeg
/usr/local/bin/ffmpeg
/workspace # ffmpeg -version
ffmpeg version 6.0 Copyright (c) 2000-2023 the FFmpeg developers
built with gcc 10.2.1 (Alpine 10.2.1_pre1) 20201203
configuration: --disable-debug --disable-doc --disable-ffplay --enable-fontconfig --enable-gpl --enable-libaom --enable-libaribb24 --enable-libass --enable-libbluray --enable-libfdk_aac --enable-libfreetype --enable-libkvazaar --enable-libmp3lame --enable-libopencore-amrnb --enable-libopencore-amrwb --enable-libopenjpeg --enable-libopus --enable-libsrt --enable-libtheora --enable-libvidstab --enable-libvorbis --enable-libvpx --enable-libwebp --enable-libx264 --enable-libx265 --enable-libxcb --enable-libxvid --enable-libzmq --enable-nonfree --enable-openssl --enable-postproc --enable-shared --enable-small --enable-version3 --extra-cflags=-I/opt/ffmpeg/include --extra-ldflags=-L/opt/ffmpeg/lib --extra-libs=-ldl --extra-libs=-lpthread --prefix=/opt/ffmpeg
libavutil      58.  2.100 / 58.  2.100
libavcodec     60.  3.100 / 60.  3.100
libavformat    60.  3.100 / 60.  3.100
libavdevice    60.  1.100 / 60.  1.100
libavfilter     9.  3.100 /  9.  3.100
libswscale      7.  1.100 /  7.  1.100
libswresample   4. 10.100 /  4. 10.100
libpostproc    57.  1.100 / 57.  1.100
/workspace # ffmpeg \
> -i samples/input.mp4 \
> outputs/docker_audio.wav
ffmpeg version 6.0 Copyright (c) 2000-2023 the FFmpeg developers
  built with gcc 10.2.1 (Alpine 10.2.1_pre1) 20201203
  configuration: --disable-debug --disable-doc --disable-ffplay --enable-fontconfig --enable-gpl --enable-libaom --enable-libaribb24 --enable-libass --enable-libbluray --enable-libfdk_aac --enable-libfreetype --enable-libkvazaar --enable-libmp3lame --enable-libopencore-amrnb --enable-libopencore-amrwb --enable-libopenjpeg --enable-libopus --enable-libsrt --enable-libtheora --enable-libvidstab --enable-libvorbis --enable-libvpx --enable-libwebp --enable-libx264 --enable-libx265 --enable-libxcb --enable-libxvid --enable-libzmq --enable-nonfree --enable-openssl --enable-postproc --enable-shared --enable-small --enable-version3 --extra-cflags=-I/opt/ffmpeg/include --extra-ldflags=-L/opt/ffmpeg/lib --extra-libs=-ldl --extra-libs=-lpthread --prefix=/opt/ffmpeg
  libavutil      58.  2.100 / 58.  2.100
  libavcodec     60.  3.100 / 60.  3.100
  libavformat    60.  3.100 / 60.  3.100
  libavdevice    60.  1.100 / 60.  1.100
  libavfilter     9.  3.100 /  9.  3.100
  libswscale      7.  1.100 /  7.  1.100
  libswresample   4. 10.100 /  4. 10.100
  libpostproc    57.  1.100 / 57.  1.100
Input #0, mov,mp4,m4a,3gp,3g2,mj2, from 'samples/input.mp4':
  Metadata:
    major_brand     : isom
    minor_version   : 512
    compatible_brands: isomiso2avc1mp41
    encoder         : Lavf58.29.100
  Duration: 00:01:00.14, start: 0.000000, bitrate: 2152 kb/s
  Stream #0:0[0x1](und): Video: h264 (avc1 / 0x31637661), yuv420p(tv, bt709, progressive), 1920x1080 [SAR 1:1 DAR 16:9], 2020 kb/s, 25.02 fps, 25 tbr, 90k tbn (default)
    Metadata:
      handler_name    : VideoHandler
      vendor_id       : [0][0][0][0]
  Stream #0:1[0x2](und): Audio: aac (mp4a / 0x6134706D), 44100 Hz, stereo, fltp, 128 kb/s (default)
    Metadata:
      handler_name    : SoundHandler
      vendor_id       : [0][0][0][0]
Stream mapping:
  Stream #0:1 -> #0:0 (aac (native) -> pcm_s16le (native))
Press [q] to stop, [?] for help
Output #0, wav, to 'outputs/docker_audio.wav':
  Metadata:
    major_brand     : isom
    minor_version   : 512
    compatible_brands: isomiso2avc1mp41
    ISFT            : Lavf60.3.100
  Stream #0:0(und): Audio: pcm_s16le ([1][0][0][0] / 0x0001), 44100 Hz, stereo, s16, 1411 kb/s (default)
    Metadata:
      handler_name    : SoundHandler
      vendor_id       : [0][0][0][0]
      encoder         : Lavc60.3.100 pcm_s16le
size=   10360kB time=00:01:00.11 bitrate=1411.8kbits/s speed= 348x    
video:0kB audio:10360kB subtitle:0kB other streams:0kB global headers:0kB muxing overhead: 0.000735%
/workspace # 
/workspace # 
/workspace # ls outputs
audio.wav         docker_audio.wav  enhanced.mp4      normalized.wav
/workspace # ffmpeg \
> -i outputs/docker_audio.wav \
> -af loudnorm \
> outputs/docker_normalized.wav
ffmpeg version 6.0 Copyright (c) 2000-2023 the FFmpeg developers
  built with gcc 10.2.1 (Alpine 10.2.1_pre1) 20201203
  configuration: --disable-debug --disable-doc --disable-ffplay --enable-fontconfig --enable-gpl --enable-libaom --enable-libaribb24 --enable-libass --enable-libbluray --enable-libfdk_aac --enable-libfreetype --enable-libkvazaar --enable-libmp3lame --enable-libopencore-amrnb --enable-libopencore-amrwb --enable-libopenjpeg --enable-libopus --enable-libsrt --enable-libtheora --enable-libvidstab --enable-libvorbis --enable-libvpx --enable-libwebp --enable-libx264 --enable-libx265 --enable-libxcb --enable-libxvid --enable-libzmq --enable-nonfree --enable-openssl --enable-postproc --enable-shared --enable-small --enable-version3 --extra-cflags=-I/opt/ffmpeg/include --extra-ldflags=-L/opt/ffmpeg/lib --extra-libs=-ldl --extra-libs=-lpthread --prefix=/opt/ffmpeg
  libavutil      58.  2.100 / 58.  2.100
  libavcodec     60.  3.100 / 60.  3.100
  libavformat    60.  3.100 / 60.  3.100
  libavdevice    60.  1.100 / 60.  1.100
  libavfilter     9.  3.100 /  9.  3.100
  libswscale      7.  1.100 /  7.  1.100
  libswresample   4. 10.100 /  4. 10.100
  libpostproc    57.  1.100 / 57.  1.100
Guessed Channel Layout for Input Stream #0.0 : stereo
Input #0, wav, from 'outputs/docker_audio.wav':
  Metadata:
    encoder         : Lavf60.3.100
  Duration: 00:01:00.14, bitrate: 1411 kb/s
  Stream #0:0: Audio: pcm_s16le ([1][0][0][0] / 0x0001), 44100 Hz, 2 channels, s16, 1411 kb/s
Stream mapping:
  Stream #0:0 -> #0:0 (pcm_s16le (native) -> pcm_s16le (native))
Press [q] to stop, [?] for help
Output #0, wav, to 'outputs/docker_normalized.wav':
  Metadata:
    ISFT            : Lavf60.3.100
  Stream #0:0: Audio: pcm_s16le ([1][0][0][0] / 0x0001), 192000 Hz, stereo, s16, 6144 kb/s
    Metadata:
      encoder         : Lavc60.3.100 pcm_s16le
size=   45105kB time=00:00:57.30 bitrate=6448.5kbits/s speed=18.4x       
video:0kB audio:45105kB subtitle:0kB other streams:0kB global headers:0kB muxing overhead: 0.000221%
/workspace # 
/workspace # exit
vikash@Vikashs-MacBook-Pro AI-ForgeStream % 

## Create docker_enhanced.mp4
/workspace # ffmpeg \
> -i samples/input.mp4 \
> -i outputs/docker_normalized.wav \
> -c:v copy \
> -map 0:v:0 \
> -map 1:a:0 \
> outputs/docker_enhanced.mp4
ffmpeg version 6.0 Copyright (c) 2000-2023 the FFmpeg developers
  built with gcc 10.2.1 (Alpine 10.2.1_pre1) 20201203
  configuration: --disable-debug --disable-doc --disable-ffplay --enable-fontconfig --enable-gpl --enable-libaom --enable-libaribb24 --enable-libass --enable-libbluray --enable-libfdk_aac --enable-libfreetype --enable-libkvazaar --enable-libmp3lame --enable-libopencore-amrnb --enable-libopencore-amrwb --enable-libopenjpeg --enable-libopus --enable-libsrt --enable-libtheora --enable-libvidstab --enable-libvorbis --enable-libvpx --enable-libwebp --enable-libx264 --enable-libx265 --enable-libxcb --enable-libxvid --enable-libzmq --enable-nonfree --enable-openssl --enable-postproc --enable-shared --enable-small --enable-version3 --extra-cflags=-I/opt/ffmpeg/include --extra-ldflags=-L/opt/ffmpeg/lib --extra-libs=-ldl --extra-libs=-lpthread --prefix=/opt/ffmpeg
  libavutil      58.  2.100 / 58.  2.100
  libavcodec     60.  3.100 / 60.  3.100
  libavformat    60.  3.100 / 60.  3.100
  libavdevice    60.  1.100 / 60.  1.100
  libavfilter     9.  3.100 /  9.  3.100
  libswscale      7.  1.100 /  7.  1.100
  libswresample   4. 10.100 /  4. 10.100
  libpostproc    57.  1.100 / 57.  1.100
Input #0, mov,mp4,m4a,3gp,3g2,mj2, from 'samples/input.mp4':
  Metadata:
    major_brand     : isom
    minor_version   : 512
    compatible_brands: isomiso2avc1mp41
    encoder         : Lavf58.29.100
  Duration: 00:01:00.14, start: 0.000000, bitrate: 2152 kb/s
  Stream #0:0[0x1](und): Video: h264 (avc1 / 0x31637661), yuv420p(tv, bt709, progressive), 1920x1080 [SAR 1:1 DAR 16:9], 2020 kb/s, 25.02 fps, 25 tbr, 90k tbn (default)
    Metadata:
      handler_name    : VideoHandler
      vendor_id       : [0][0][0][0]
  Stream #0:1[0x2](und): Audio: aac (mp4a / 0x6134706D), 44100 Hz, stereo, fltp, 128 kb/s (default)
    Metadata:
      handler_name    : SoundHandler
      vendor_id       : [0][0][0][0]
Input #1, wav, from 'outputs/docker_normalized.wav':
  Metadata:
    encoder         : Lavf60.3.100
  Duration: 00:01:00.14, bitrate: 6144 kb/s
  Stream #1:0: Audio: pcm_s16le ([1][0][0][0] / 0x0001), 192000 Hz, stereo, s16, 6144 kb/s
Stream mapping:
  Stream #0:0 -> #0:0 (copy)
  Stream #1:0 -> #0:1 (pcm_s16le (native) -> aac (native))
Press [q] to stop, [?] for help
Output #0, mp4, to 'outputs/docker_enhanced.mp4':
  Metadata:
    major_brand     : isom
    minor_version   : 512
    compatible_brands: isomiso2avc1mp41
    encoder         : Lavf60.3.100
  Stream #0:0(und): Video: h264 (avc1 / 0x31637661), yuv420p(tv, bt709, progressive), 1920x1080 [SAR 1:1 DAR 16:9], q=2-31, 2020 kb/s, 25.02 fps, 25 tbr, 90k tbn (default)
    Metadata:
      handler_name    : VideoHandler
      vendor_id       : [0][0][0][0]
  Stream #0:1: Audio: aac (mp4a / 0x6134706D), 96000 Hz, stereo, fltp, 128 kb/s
    Metadata:
      encoder         : Lavc60.3.100 aac
frame= 1503 fps=670 q=-1.0 Lsize=   15829kB time=00:01:00.13 bitrate=2156.2kbits/s speed=26.8x      
video:14814kB audio:953kB subtitle:0kB other streams:0kB global headers:0kB muxing overhead: 0.395741%
[aac @ 0x7fb9b0b834c0] Qavg: 715.003
/workspace # 
/workspace # 
/workspace # ls -lh outputs/docker_enhanced.mp4
-rw-r--r--    1 root     root       15.5M Jun 19 17:43 outputs/docker_enhanced.mp4
/workspace # 
/workspace # 
/workspace # ffprobe outputs/docker_enhanced.mp4
ffprobe version 6.0 Copyright (c) 2007-2023 the FFmpeg developers
  built with gcc 10.2.1 (Alpine 10.2.1_pre1) 20201203
  configuration: --disable-debug --disable-doc --disable-ffplay --enable-fontconfig --enable-gpl --enable-libaom --enable-libaribb24 --enable-libass --enable-libbluray --enable-libfdk_aac --enable-libfreetype --enable-libkvazaar --enable-libmp3lame --enable-libopencore-amrnb --enable-libopencore-amrwb --enable-libopenjpeg --enable-libopus --enable-libsrt --enable-libtheora --enable-libvidstab --enable-libvorbis --enable-libvpx --enable-libwebp --enable-libx264 --enable-libx265 --enable-libxcb --enable-libxvid --enable-libzmq --enable-nonfree --enable-openssl --enable-postproc --enable-shared --enable-small --enable-version3 --extra-cflags=-I/opt/ffmpeg/include --extra-ldflags=-L/opt/ffmpeg/lib --extra-libs=-ldl --extra-libs=-lpthread --prefix=/opt/ffmpeg
  libavutil      58.  2.100 / 58.  2.100
  libavcodec     60.  3.100 / 60.  3.100
  libavformat    60.  3.100 / 60.  3.100
  libavdevice    60.  1.100 / 60.  1.100
  libavfilter     9.  3.100 /  9.  3.100
  libswscale      7.  1.100 /  7.  1.100
  libswresample   4. 10.100 /  4. 10.100
  libpostproc    57.  1.100 / 57.  1.100
Input #0, mov,mp4,m4a,3gp,3g2,mj2, from 'outputs/docker_enhanced.mp4':
  Metadata:
    major_brand     : isom
    minor_version   : 512
    compatible_brands: isomiso2avc1mp41
    encoder         : Lavf60.3.100
  Duration: 00:01:00.14, start: 0.000000, bitrate: 2156 kb/s
  Stream #0:0[0x1](und): Video: h264 (avc1 / 0x31637661), yuv420p(tv, bt709, progressive), 1920x1080 [SAR 1:1 DAR 16:9], 2020 kb/s, 25.02 fps, 25 tbr, 90k tbn (default)
    Metadata:
      handler_name    : VideoHandler
      vendor_id       : [0][0][0][0]
  Stream #0:1[0x2](und): Audio: aac (mp4a / 0x6134706D), 96000 Hz, stereo, fltp, 129 kb/s (default)
    Metadata:
      handler_name    : SoundHandler
      vendor_id       : [0][0][0][0]
/workspace # 

## Create Processing Script
/workspace # mkdir -p scripts
/workspace # touch scripts/process.sh
/workspace # chmod +x scripts/process.sh
/workspace # code scripts/process.sh
sh: code: not found
/workspace # vim scripts/process.sh
sh: vim: not found
/workspace # vi scripts/process.sh
/workspace # cat scripts/process.sh
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
/workspace # sh scripts/process.sh
Extracting Audio...
ffmpeg version 6.0 Copyright (c) 2000-2023 the FFmpeg developers
  built with gcc 10.2.1 (Alpine 10.2.1_pre1) 20201203
  configuration: --disable-debug --disable-doc --disable-ffplay --enable-fontconfig --enable-gpl --enable-libaom --enable-libaribb24 --enable-libass --enable-libbluray --enable-libfdk_aac --enable-libfreetype --enable-libkvazaar --enable-libmp3lame --enable-libopencore-amrnb --enable-libopencore-amrwb --enable-libopenjpeg --enable-libopus --enable-libsrt --enable-libtheora --enable-libvidstab --enable-libvorbis --enable-libvpx --enable-libwebp --enable-libx264 --enable-libx265 --enable-libxcb --enable-libxvid --enable-libzmq --enable-nonfree --enable-openssl --enable-postproc --enable-shared --enable-small --enable-version3 --extra-cflags=-I/opt/ffmpeg/include --extra-ldflags=-L/opt/ffmpeg/lib --extra-libs=-ldl --extra-libs=-lpthread --prefix=/opt/ffmpeg
  libavutil      58.  2.100 / 58.  2.100
  libavcodec     60.  3.100 / 60.  3.100
  libavformat    60.  3.100 / 60.  3.100
  libavdevice    60.  1.100 / 60.  1.100
  libavfilter     9.  3.100 /  9.  3.100
  libswscale      7.  1.100 /  7.  1.100
  libswresample   4. 10.100 /  4. 10.100
  libpostproc    57.  1.100 / 57.  1.100
Input #0, mov,mp4,m4a,3gp,3g2,mj2, from 'samples/input.mp4':
  Metadata:
    major_brand     : isom
    minor_version   : 512
    compatible_brands: isomiso2avc1mp41
    encoder         : Lavf58.29.100
  Duration: 00:01:00.14, start: 0.000000, bitrate: 2152 kb/s
  Stream #0:0[0x1](und): Video: h264 (avc1 / 0x31637661), yuv420p(tv, bt709, progressive), 1920x1080 [SAR 1:1 DAR 16:9], 2020 kb/s, 25.02 fps, 25 tbr, 90k tbn (default)
    Metadata:
      handler_name    : VideoHandler
      vendor_id       : [0][0][0][0]
  Stream #0:1[0x2](und): Audio: aac (mp4a / 0x6134706D), 44100 Hz, stereo, fltp, 128 kb/s (default)
    Metadata:
      handler_name    : SoundHandler
      vendor_id       : [0][0][0][0]
File 'outputs/audio.wav' already exists. Overwrite? [y/N] y
Stream mapping:
  Stream #0:1 -> #0:0 (aac (native) -> pcm_s16le (native))
Press [q] to stop, [?] for help
Output #0, wav, to 'outputs/audio.wav':
  Metadata:
    major_brand     : isom
    minor_version   : 512
    compatible_brands: isomiso2avc1mp41
    ISFT            : Lavf60.3.100
  Stream #0:0(und): Audio: pcm_s16le ([1][0][0][0] / 0x0001), 44100 Hz, stereo, s16, 1411 kb/s (default)
    Metadata:
      handler_name    : SoundHandler
      vendor_id       : [0][0][0][0]
      encoder         : Lavc60.3.100 pcm_s16le
size=   10360kB time=00:01:00.11 bitrate=1411.8kbits/s speed= 320x    
video:0kB audio:10360kB subtitle:0kB other streams:0kB global headers:0kB muxing overhead: 0.000735%
Normalizing Audio...
ffmpeg version 6.0 Copyright (c) 2000-2023 the FFmpeg developers
  built with gcc 10.2.1 (Alpine 10.2.1_pre1) 20201203
  configuration: --disable-debug --disable-doc --disable-ffplay --enable-fontconfig --enable-gpl --enable-libaom --enable-libaribb24 --enable-libass --enable-libbluray --enable-libfdk_aac --enable-libfreetype --enable-libkvazaar --enable-libmp3lame --enable-libopencore-amrnb --enable-libopencore-amrwb --enable-libopenjpeg --enable-libopus --enable-libsrt --enable-libtheora --enable-libvidstab --enable-libvorbis --enable-libvpx --enable-libwebp --enable-libx264 --enable-libx265 --enable-libxcb --enable-libxvid --enable-libzmq --enable-nonfree --enable-openssl --enable-postproc --enable-shared --enable-small --enable-version3 --extra-cflags=-I/opt/ffmpeg/include --extra-ldflags=-L/opt/ffmpeg/lib --extra-libs=-ldl --extra-libs=-lpthread --prefix=/opt/ffmpeg
  libavutil      58.  2.100 / 58.  2.100
  libavcodec     60.  3.100 / 60.  3.100
  libavformat    60.  3.100 / 60.  3.100
  libavdevice    60.  1.100 / 60.  1.100
  libavfilter     9.  3.100 /  9.  3.100
  libswscale      7.  1.100 /  7.  1.100
  libswresample   4. 10.100 /  4. 10.100
  libpostproc    57.  1.100 / 57.  1.100
Guessed Channel Layout for Input Stream #0.0 : stereo
Input #0, wav, from 'outputs/audio.wav':
  Metadata:
    encoder         : Lavf60.3.100
  Duration: 00:01:00.14, bitrate: 1411 kb/s
  Stream #0:0: Audio: pcm_s16le ([1][0][0][0] / 0x0001), 44100 Hz, 2 channels, s16, 1411 kb/s
File 'outputs/normalized.wav' already exists. Overwrite? [y/N] y
Stream mapping:
  Stream #0:0 -> #0:0 (pcm_s16le (native) -> pcm_s16le (native))
Press [q] to stop, [?] for help
Output #0, wav, to 'outputs/normalized.wav':
  Metadata:
    ISFT            : Lavf60.3.100
  Stream #0:0: Audio: pcm_s16le ([1][0][0][0] / 0x0001), 192000 Hz, stereo, s16, 6144 kb/s
    Metadata:
      encoder         : Lavc60.3.100 pcm_s16le
size=   45105kB time=00:00:57.30 bitrate=6448.5kbits/s speed=22.5x       
video:0kB audio:45105kB subtitle:0kB other streams:0kB global headers:0kB muxing overhead: 0.000221%
Creating Enhanced Video...
ffmpeg version 6.0 Copyright (c) 2000-2023 the FFmpeg developers
  built with gcc 10.2.1 (Alpine 10.2.1_pre1) 20201203
  configuration: --disable-debug --disable-doc --disable-ffplay --enable-fontconfig --enable-gpl --enable-libaom --enable-libaribb24 --enable-libass --enable-libbluray --enable-libfdk_aac --enable-libfreetype --enable-libkvazaar --enable-libmp3lame --enable-libopencore-amrnb --enable-libopencore-amrwb --enable-libopenjpeg --enable-libopus --enable-libsrt --enable-libtheora --enable-libvidstab --enable-libvorbis --enable-libvpx --enable-libwebp --enable-libx264 --enable-libx265 --enable-libxcb --enable-libxvid --enable-libzmq --enable-nonfree --enable-openssl --enable-postproc --enable-shared --enable-small --enable-version3 --extra-cflags=-I/opt/ffmpeg/include --extra-ldflags=-L/opt/ffmpeg/lib --extra-libs=-ldl --extra-libs=-lpthread --prefix=/opt/ffmpeg
  libavutil      58.  2.100 / 58.  2.100
  libavcodec     60.  3.100 / 60.  3.100
  libavformat    60.  3.100 / 60.  3.100
  libavdevice    60.  1.100 / 60.  1.100
  libavfilter     9.  3.100 /  9.  3.100
  libswscale      7.  1.100 /  7.  1.100
  libswresample   4. 10.100 /  4. 10.100
  libpostproc    57.  1.100 / 57.  1.100
Input #0, mov,mp4,m4a,3gp,3g2,mj2, from 'samples/input.mp4':
  Metadata:
    major_brand     : isom
    minor_version   : 512
    compatible_brands: isomiso2avc1mp41
    encoder         : Lavf58.29.100
  Duration: 00:01:00.14, start: 0.000000, bitrate: 2152 kb/s
  Stream #0:0[0x1](und): Video: h264 (avc1 / 0x31637661), yuv420p(tv, bt709, progressive), 1920x1080 [SAR 1:1 DAR 16:9], 2020 kb/s, 25.02 fps, 25 tbr, 90k tbn (default)
    Metadata:
      handler_name    : VideoHandler
      vendor_id       : [0][0][0][0]
  Stream #0:1[0x2](und): Audio: aac (mp4a / 0x6134706D), 44100 Hz, stereo, fltp, 128 kb/s (default)
    Metadata:
      handler_name    : SoundHandler
      vendor_id       : [0][0][0][0]
Input #1, wav, from 'outputs/normalized.wav':
  Metadata:
    encoder         : Lavf60.3.100
  Duration: 00:01:00.14, bitrate: 6144 kb/s
  Stream #1:0: Audio: pcm_s16le ([1][0][0][0] / 0x0001), 192000 Hz, stereo, s16, 6144 kb/s
File 'outputs/enhanced.mp4' already exists. Overwrite? [y/N] y
Stream mapping:
  Stream #0:0 -> #0:0 (copy)
  Stream #1:0 -> #0:1 (pcm_s16le (native) -> aac (native))
Press [q] to stop, [?] for help
Output #0, mp4, to 'outputs/enhanced.mp4':
  Metadata:
    major_brand     : isom
    minor_version   : 512
    compatible_brands: isomiso2avc1mp41
    encoder         : Lavf60.3.100
  Stream #0:0(und): Video: h264 (avc1 / 0x31637661), yuv420p(tv, bt709, progressive), 1920x1080 [SAR 1:1 DAR 16:9], q=2-31, 2020 kb/s, 25.02 fps, 25 tbr, 90k tbn (default)
    Metadata:
      handler_name    : VideoHandler
      vendor_id       : [0][0][0][0]
  Stream #0:1: Audio: aac (mp4a / 0x6134706D), 96000 Hz, stereo, fltp, 128 kb/s
    Metadata:
      encoder         : Lavc60.3.100 aac
frame= 1503 fps=662 q=-1.0 Lsize=   15829kB time=00:01:00.13 bitrate=2156.2kbits/s speed=26.5x      
video:14814kB audio:953kB subtitle:0kB other streams:0kB global headers:0kB muxing overhead: 0.395741%
[aac @ 0x7f8e4300a4c0] Qavg: 715.003
Done
/workspace # 

## Implementing Kubernetes Architecture
# Enabled Docker Desktop Kubernetes
vikash@Vikashs-MacBook-Pro AI-ForgeStream % kubectl cluster-info
Kubernetes control plane is running at https://127.0.0.1:50126
CoreDNS is running at https://127.0.0.1:50126/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy

To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'.
vikash@Vikashs-MacBook-Pro AI-ForgeStream % kubectl get nodes
NAME                    STATUS   ROLES           AGE     VERSION
desktop-control-plane   Ready    control-plane   2m44s   v1.36.1
vikash@Vikashs-MacBook-Pro AI-ForgeStream %
vikash@Vikashs-MacBook-Pro AI-ForgeStream % kubectl config get-contexts
CURRENT   NAME                      CLUSTER                   AUTHINFO                  NAMESPACE
*         docker-desktop            docker-desktop            docker-desktop            
          kind-terraform-provider   kind-terraform-provider   kind-terraform-provider   

# Builing K8 namespace set-up
vikash@Vikashs-MacBook-Pro AI-ForgeStream % code k8s/namespace.yaml    
vikash@Vikashs-MacBook-Pro AI-ForgeStream % cat k8s/namespace.yaml
apiVersion: v1
kind: Namespace

metadata:
  name: ai-forgestream%                                                                                                                                                                                                     
vikash@Vikashs-MacBook-Pro AI-ForgeStream % kubectl apply -f k8s/namespace.yaml
namespace/ai-forgestream created
vikash@Vikashs-MacBook-Pro AI-ForgeStream % kubectl get ns
NAME                 STATUS   AGE
ai-forgestream       Active   13s
default              Active   15m
kube-node-lease      Active   15m
kube-public          Active   15m
kube-system          Active   15m
local-path-storage   Active   15m

# Builing K8 Job set-up
vikash@Vikashs-MacBook-Pro AI-ForgeStream % code k8s/ffmpeg-version-job.yaml
vikash@Vikashs-MacBook-Pro AI-ForgeStream % cat k8s/ffmpeg-version-job.yaml          
apiVersion: batch/v1
kind: Job

metadata:
  name: ffmpeg-version
  namespace: ai-forgestream

spec:

  template:

    spec:

      restartPolicy: Never

      containers:

      - name: ffmpeg

        image: jrottenberg/ffmpeg:6.0-alpine

        command:
        - ffmpeg

        args:
        - -version

  backoffLimit: 1%
vikash@Vikashs-MacBook-Pro AI-ForgeStream % kubectl apply -f k8s/ffmpeg-version-job.yaml
job.batch/ffmpeg-version created
vikash@Vikashs-MacBook-Pro AI-ForgeStream % kubectl get jobs -n ai-forgestream
NAME             STATUS     COMPLETIONS   DURATION   AGE
ffmpeg-version   Complete   1/1           10s        10s
vikash@Vikashs-MacBook-Pro AI-ForgeStream % kubectl get all -n ai-forgestream
NAME                       READY   STATUS      RESTARTS   AGE
pod/ffmpeg-version-768w4   0/1     Completed   0          6m29s

NAME                       STATUS     COMPLETIONS   DURATION   AGE
job.batch/ffmpeg-version   Complete   1/1           10s        6m29s
vikash@Vikashs-MacBook-Pro AI-ForgeStream % kubectl logs -n ai-forgestream ffmpeg-version-768w4
ffmpeg version 6.0 Copyright (c) 2000-2023 the FFmpeg developers
built with gcc 10.2.1 (Alpine 10.2.1_pre1) 20201203
configuration: --disable-debug --disable-doc --disable-ffplay --enable-fontconfig --enable-gpl --enable-libaom --enable-libaribb24 --enable-libass --enable-libbluray --enable-libfdk_aac --enable-libfreetype --enable-libkvazaar --enable-libmp3lame --enable-libopencore-amrnb --enable-libopencore-amrwb --enable-libopenjpeg --enable-libopus --enable-libsrt --enable-libtheora --enable-libvidstab --enable-libvorbis --enable-libvpx --enable-libwebp --enable-libx264 --enable-libx265 --enable-libxcb --enable-libxvid --enable-libzmq --enable-nonfree --enable-openssl --enable-postproc --enable-shared --enable-small --enable-version3 --extra-cflags=-I/opt/ffmpeg/include --extra-ldflags=-L/opt/ffmpeg/lib --extra-libs=-ldl --extra-libs=-lpthread --prefix=/opt/ffmpeg
libavutil      58.  2.100 / 58.  2.100
libavcodec     60.  3.100 / 60.  3.100
libavformat    60.  3.100 / 60.  3.100
libavdevice    60.  1.100 / 60.  1.100
libavfilter     9.  3.100 /  9.  3.100
libswscale      7.  1.100 /  7.  1.100
libswresample   4. 10.100 /  4. 10.100
libpostproc    57.  1.100 / 57.  1.100

# Builing K8 Processing Job set-up
vikash@Vikashs-MacBook-Pro AI-ForgeStream % code k8s/ffmpeg-processing-job.yaml
vikash@Vikashs-MacBook-Pro AI-ForgeStream % cat k8s/ffmpeg-processing-job.yaml
apiVersion: batch/v1
kind: Job

metadata:
  name: ffmpeg-processing
  namespace: ai-forgestream

spec:

  template:

    spec:

      restartPolicy: Never

      containers:

      - name: ffmpeg

        image: jrottenberg/ffmpeg:6.0-alpine

        command:
        - sh

        - -c

        args:
        - |
          echo "Starting Processing";
          ffmpeg -version;
          echo "Processing Complete";

  backoffLimit: 1%                                                                                                                                                                                                          
vikash@Vikashs-MacBook-Pro AI-ForgeStream % kubectl apply -f k8s/ffmpeg-processing-job.yaml
job.batch/ffmpeg-processing created
vikash@Vikashs-MacBook-Pro AI-ForgeStream % kubectl get jobs -n ai-forgestream
NAME                STATUS     COMPLETIONS   DURATION   AGE
ffmpeg-processing   Complete   1/1           3s         15s
ffmpeg-version      Complete   1/1           10s        27m
vikash@Vikashs-MacBook-Pro AI-ForgeStream % kubectl get pods -n ai-forgestream
NAME                      READY   STATUS      RESTARTS   AGE
ffmpeg-processing-jqhb7   0/1     Completed   0          29s
ffmpeg-version-768w4      0/1     Completed   0          27m
vikash@Vikashs-MacBook-Pro AI-ForgeStream % kubectl logs -n ai-forgestream ffmpeg-processing-jqhb7
Starting Processing
ffmpeg version 6.0 Copyright (c) 2000-2023 the FFmpeg developers
built with gcc 10.2.1 (Alpine 10.2.1_pre1) 20201203
configuration: --disable-debug --disable-doc --disable-ffplay --enable-fontconfig --enable-gpl --enable-libaom --enable-libaribb24 --enable-libass --enable-libbluray --enable-libfdk_aac --enable-libfreetype --enable-libkvazaar --enable-libmp3lame --enable-libopencore-amrnb --enable-libopencore-amrwb --enable-libopenjpeg --enable-libopus --enable-libsrt --enable-libtheora --enable-libvidstab --enable-libvorbis --enable-libvpx --enable-libwebp --enable-libx264 --enable-libx265 --enable-libxcb --enable-libxvid --enable-libzmq --enable-nonfree --enable-openssl --enable-postproc --enable-shared --enable-small --enable-version3 --extra-cflags=-I/opt/ffmpeg/include --extra-ldflags=-L/opt/ffmpeg/lib --extra-libs=-ldl --extra-libs=-lpthread --prefix=/opt/ffmpeg
libavutil      58.  2.100 / 58.  2.100
libavcodec     60.  3.100 / 60.  3.100
libavformat    60.  3.100 / 60.  3.100
libavdevice    60.  1.100 / 60.  1.100
libavfilter     9.  3.100 /  9.  3.100
libswscale      7.  1.100 /  7.  1.100
libswresample   4. 10.100 /  4. 10.100
libpostproc    57.  1.100 / 57.  1.100
Processing Complete

# ConfigMap Driven FFmpeg Platform
vikash@Vikashs-MacBook-Pro AI-ForgeStream % code k8s/ffmpeg-configmap.yaml
vikash@Vikashs-MacBook-Pro AI-ForgeStream % cat k8s/ffmpeg-configmap.yaml
apiVersion: v1
kind: ConfigMap

metadata:
  name: ffmpeg-config
  namespace: ai-forgestream

data:
  VIDEO_CODEC: "libx264"
  AUDIO_CODEC: "aac"
  VIDEO_BITRATE: "2000k"
  AUDIO_BITRATE: "128k"%                                                                                                                                                                                                    
vikash@Vikashs-MacBook-Pro AI-ForgeStream % kubectl apply -f k8s/ffmpeg-configmap.yaml
configmap/ffmpeg-config created
vikash@Vikashs-MacBook-Pro AI-ForgeStream % kubectl get configmap -n ai-forgestream
NAME               DATA   AGE
ffmpeg-config      4      6s
kube-root-ca.crt   1      35m
vikash@Vikashs-MacBook-Pro AI-ForgeStream % kubectl describe configmap ffmpeg-config -n ai-forgestream
Name:         ffmpeg-config
Namespace:    ai-forgestream
Labels:       <none>
Annotations:  <none>

Data
====
AUDIO_BITRATE:
----
128k

AUDIO_CODEC:
----
aac

VIDEO_BITRATE:
----
2000k

VIDEO_CODEC:
----
libx264


BinaryData
====

Events:  <none>
vikash@Vikashs-MacBook-Pro AI-ForgeStream % 
# Configmap Test
vikash@Vikashs-MacBook-Pro AI-ForgeStream % code k8s/configmap-test-job.yaml
vikash@Vikashs-MacBook-Pro AI-ForgeStream % cat k8s/configmap-test-job.yaml
apiVersion: batch/v1
kind: Job

metadata:
  name: configmap-test
  namespace: ai-forgestream

spec:

  template:

    spec:

      restartPolicy: Never

      containers:

      - name: test

        image: alpine

        envFrom:

        - configMapRef:
            name: ffmpeg-config

        command:
        - sh

        - -c

        args:
        - |
          echo "VIDEO_CODEC=$VIDEO_CODEC"
          echo "AUDIO_CODEC=$AUDIO_CODEC"
          echo "VIDEO_BITRATE=$VIDEO_BITRATE"
          echo "AUDIO_BITRATE=$AUDIO_BITRATE"

  backoffLimit: 1%                                                                                                                                                                                                          
vikash@Vikashs-MacBook-Pro AI-ForgeStream % kubectl apply -f k8s/configmap-test-job.yaml
job.batch/configmap-test created
vikash@Vikashs-MacBook-Pro AI-ForgeStream % kubectl get pods -n ai-forgestream
NAME                      READY   STATUS              RESTARTS   AGE
configmap-test-whl6l      0/1     ContainerCreating   0          6s
ffmpeg-processing-jqhb7   0/1     Completed           0          9m18s
ffmpeg-version-768w4      0/1     Completed           0          36m
vikash@Vikashs-MacBook-Pro AI-ForgeStream % kubectl get pods -n ai-forgestream
NAME                      READY   STATUS      RESTARTS   AGE
configmap-test-whl6l      0/1     Completed   0          15s
ffmpeg-processing-jqhb7   0/1     Completed   0          9m27s
ffmpeg-version-768w4      0/1     Completed   0          36m
vikash@Vikashs-MacBook-Pro AI-ForgeStream % kubectl logs -n ai-forgestream configmap-test-whl6l
VIDEO_CODEC=libx264
AUDIO_CODEC=aac
VIDEO_BITRATE=2000k
AUDIO_BITRATE=128k

## Setting Up the Persistent Volumes (PVC)
vikash@Vikashs-MacBook-Pro Projects % code k8s/media-pvc.yaml
vikash@Vikashs-MacBook-Pro Projects % cat k8s/media-pvc.yaml
apiVersion: v1
kind: PersistentVolumeClaim

metadata:
  name: media-storage
  namespace: ai-forgestream

spec:

  accessModes:
  - ReadWriteOnce

  resources:
    requests:
      storage: 1Gi%                                                                                                                                                                                                         
vikash@Vikashs-MacBook-Pro Projects % kubectl apply -f k8s/media-pvc.yaml
persistentvolumeclaim/media-storage created
# Verify StorageClass
vikash@Vikashs-MacBook-Pro Projects % kubectl get storageclass
NAME                 PROVISIONER             RECLAIMPOLICY   VOLUMEBINDINGMODE      ALLOWVOLUMEEXPANSION   AGE
hostpath             rancher.io/local-path   Delete          WaitForFirstConsumer   false                  65m
standard (default)   rancher.io/local-path   Delete          WaitForFirstConsumer   false                  66m
vikash@Vikashs-MacBook-Pro Projects % kubectl describe storageclass standard
Name:            standard
IsDefaultClass:  Yes
Annotations:     kubectl.kubernetes.io/last-applied-configuration={"apiVersion":"storage.k8s.io/v1","kind":"StorageClass","metadata":{"annotations":{"storageclass.kubernetes.io/is-default-class":"true"},"name":"standard"},"provisioner":"rancher.io/local-path","reclaimPolicy":"Delete","volumeBindingMode":"WaitForFirstConsumer"}
,storageclass.kubernetes.io/is-default-class=true
Provisioner:           rancher.io/local-path
Parameters:            <none>
AllowVolumeExpansion:  <unset>
MountOptions:          <none>
ReclaimPolicy:         Delete
VolumeBindingMode:     WaitForFirstConsumer
Events:                <none>
# Create a Job that uses the PVC
vikash@Vikashs-MacBook-Pro AI-ForgeStream % code k8s/pvc-test-job.yaml
vikash@Vikashs-MacBook-Pro AI-ForgeStream % cat k8s/pvc-test-job.yaml
apiVersion: batch/v1
kind: Job

metadata:
  name: pvc-test
  namespace: ai-forgestream

spec:

  template:

    spec:

      restartPolicy: Never

      containers:

      - name: storage-test

        image: alpine

        command:
        - sh
        - -c

        args:
        - |
          echo "AI-ForgeStream Storage Test" > /data/test.txt
          cat /data/test.txt

        volumeMounts:
        - name: media-storage
          mountPath: /data

      volumes:
      - name: media-storage
        persistentVolumeClaim:
          claimName: media-storage

  backoffLimit: 1%                                                                                                                                                                                                          
vikash@Vikashs-MacBook-Pro AI-ForgeStream % kubectl apply -f k8s/pvc-test-job.yaml
job.batch/pvc-test created
ikash@Vikashs-MacBook-Pro AI-ForgeStream % kubectl get pvc -n ai-forgestream
NAME            STATUS   VOLUME                                     CAPACITY   ACCESS MODES   STORAGECLASS   VOLUMEATTRIBUTESCLASS   AGE
media-storage   Bound    pvc-ddafda19-805f-49d2-b35e-0342c80d6b65   1Gi        RWO            standard       <unset>                 7m45s
vikash@Vikashs-MacBook-Pro AI-ForgeStream % kubectl get jobs -n ai-forgestream
NAME                STATUS     COMPLETIONS   DURATION   AGE
configmap-test      Complete   1/1           10s        17m
ffmpeg-processing   Complete   1/1           3s         27m
ffmpeg-version      Complete   1/1           10s        53m
pvc-test            Complete   1/1           11s        21s
vikash@Vikashs-MacBook-Pro AI-ForgeStream % kubectl get pods -n ai-forgestream
NAME                      READY   STATUS      RESTARTS   AGE
configmap-test-whl6l      0/1     Completed   0          18m
ffmpeg-processing-jqhb7   0/1     Completed   0          27m
ffmpeg-version-768w4      0/1     Completed   0          54m
pvc-test-rxhrh            0/1     Completed   0          52s
vikash@Vikashs-MacBook-Pro AI-ForgeStream % kubectl logs -n ai-forgestream pvc-test-rxhrh 
AI-ForgeStream Storage Test

## Create Real FFmpeg Processing Job
vikash@Vikashs-MacBook-Pro AI-ForgeStream % code k8s/ffmpeg-real-job.yaml
vikash@Vikashs-MacBook-Pro AI-ForgeStream % cat k8s/ffmpeg-real-job.yaml
apiVersion: batch/v1
kind: Job

metadata:
  name: ffmpeg-real
  namespace: ai-forgestream

spec:

  template:

    spec:

      restartPolicy: Never

      containers:

      - name: ffmpeg

        image: jrottenberg/ffmpeg:6.0-alpine

        command:
        - sh
        - -c

        args:
        - |
          echo "Starting FFmpeg Processing"

          ffmpeg \
          -f lavfi \
          -i testsrc=duration=10:size=1280x720:rate=30 \
          -c:v libx264 \
          /data/test-video.mp4

          echo "Completed"

          ls -lh /data

        volumeMounts:
        - name: media-storage
          mountPath: /data

      volumes:
      - name: media-storage
        persistentVolumeClaim:
          claimName: media-storage

  backoffLimit: 1%                                                                                                                                                                                                          
vikash@Vikashs-MacBook-Pro AI-ForgeStream % kubectl apply -f k8s/ffmpeg-real-job.yaml
job.batch/ffmpeg-real created
vikash@Vikashs-MacBook-Pro AI-ForgeStream % kubectl get jobs -n ai-forgestream
NAME                STATUS     COMPLETIONS   DURATION   AGE
configmap-test      Complete   1/1           10s        23m
ffmpeg-processing   Complete   1/1           3s         32m
ffmpeg-real         Running    0/1           5s         5s
ffmpeg-version      Complete   1/1           10s        59m
pvc-test            Complete   1/1           11s        6m3s
vikash@Vikashs-MacBook-Pro AI-ForgeStream % kubectl get pods -n ai-forgestream
NAME                      READY   STATUS      RESTARTS   AGE
configmap-test-whl6l      0/1     Completed   0          23m
ffmpeg-processing-jqhb7   0/1     Completed   0          32m
ffmpeg-real-m5tlm         0/1     Completed   0          11s
ffmpeg-version-768w4      0/1     Completed   0          59m
pvc-test-rxhrh            0/1     Completed   0          6m9s
vikash@Vikashs-MacBook-Pro AI-ForgeStream % kubectl get pods -n ai-forgestream ffmpeg-real-m5tlm
NAME                READY   STATUS      RESTARTS   AGE
ffmpeg-real-m5tlm   0/1     Completed   0          57s
vikash@Vikashs-MacBook-Pro AI-ForgeStream % kubectl logs -n ai-forgestream ffmpeg-real-m5tlm
Starting FFmpeg Processing
ffmpeg version 6.0 Copyright (c) 2000-2023 the FFmpeg developers
  built with gcc 10.2.1 (Alpine 10.2.1_pre1) 20201203
  configuration: --disable-debug --disable-doc --disable-ffplay --enable-fontconfig --enable-gpl --enable-libaom --enable-libaribb24 --enable-libass --enable-libbluray --enable-libfdk_aac --enable-libfreetype --enable-libkvazaar --enable-libmp3lame --enable-libopencore-amrnb --enable-libopencore-amrwb --enable-libopenjpeg --enable-libopus --enable-libsrt --enable-libtheora --enable-libvidstab --enable-libvorbis --enable-libvpx --enable-libwebp --enable-libx264 --enable-libx265 --enable-libxcb --enable-libxvid --enable-libzmq --enable-nonfree --enable-openssl --enable-postproc --enable-shared --enable-small --enable-version3 --extra-cflags=-I/opt/ffmpeg/include --extra-ldflags=-L/opt/ffmpeg/lib --extra-libs=-ldl --extra-libs=-lpthread --prefix=/opt/ffmpeg
  libavutil      58.  2.100 / 58.  2.100
  libavcodec     60.  3.100 / 60.  3.100
  libavformat    60.  3.100 / 60.  3.100
  libavdevice    60.  1.100 / 60.  1.100
  libavfilter     9.  3.100 /  9.  3.100
  libswscale      7.  1.100 /  7.  1.100
  libswresample   4. 10.100 /  4. 10.100
  libpostproc    57.  1.100 / 57.  1.100
Input #0, lavfi, from 'testsrc=duration=10:size=1280x720:rate=30':
  Duration: N/A, start: 0.000000, bitrate: N/A
  Stream #0:0: Video: wrapped_avframe, rgb24, 1280x720 [SAR 1:1 DAR 16:9], 30 fps, 30 tbr, 30 tbn
Stream mapping:
  Stream #0:0 -> #0:0 (wrapped_avframe (native) -> h264 (libx264))
Press [q] to stop, [?] for help
[libx264 @ 0x7f63b2f38840] using SAR=1/1
[libx264 @ 0x7f63b2f38840] using cpu capabilities: MMX2 SSE2Fast SSSE3 SSE4.2 AVX FMA3 AVX2 LZCNT BMI2
[libx264 @ 0x7f63b2f38840] profile High 4:4:4 Predictive, level 3.1, 4:4:4 8-bit
[libx264 @ 0x7f63b2f38840] 264 - core 148 - H.264/MPEG-4 AVC codec - Copyleft 2003-2016 - http://www.videolan.org/x264.html - options: cabac=1 ref=3 deblock=1:0:0 analyse=0x3:0x113 me=hex subme=7 psy=1 psy_rd=1.00:0.00 mixed_ref=1 me_range=16 chroma_me=1 trellis=1 8x8dct=1 cqm=0 deadzone=21,11 fast_pskip=1 chroma_qp_offset=4 threads=18 lookahead_threads=3 sliced_threads=0 nr=0 decimate=1 interlaced=0 bluray_compat=0 constrained_intra=0 bframes=3 b_pyramid=2 b_adapt=1 b_bias=0 direct=1 weightb=1 open_gop=0 weightp=2 keyint=250 keyint_min=25 scenecut=40 intra_refresh=0 rc_lookahead=40 rc=crf mbtree=1 crf=23.0 qcomp=0.60 qpmin=0 qpmax=69 qpstep=4 ip_ratio=1.40 aq=1:1.00
Output #0, mp4, to '/data/test-video.mp4':
  Metadata:
    encoder         : Lavf60.3.100
  Stream #0:0: Video: h264 (avc1 / 0x31637661), yuv444p(tv, progressive), 1280x720 [SAR 1:1 DAR 16:9], q=2-31, 30 fps, 15360 tbn
    Metadata:
      encoder         : Lavc60.3.100 libx264
    Side data:
      cpb: bitrate max/min/avg: 0/0/0 buffer size: 0 vbv_delay: N/A
frame=  300 fps=125 q=-1.0 Lsize=     120kB time=00:00:09.90 bitrate=  99.2kbits/s speed=4.12x     
video:116kB audio:0kB subtitle:0kB other streams:0kB global headers:0kB muxing overhead: 3.751299%
[libx264 @ 0x7f63b2f38840] frame I:2     Avg QP:12.01  size:  7763
[libx264 @ 0x7f63b2f38840] frame P:77    Avg QP:13.08  size:   784
[libx264 @ 0x7f63b2f38840] frame B:221   Avg QP:15.18  size:   189
[libx264 @ 0x7f63b2f38840] consecutive B-frames:  1.3%  0.0%  4.0% 94.7%
[libx264 @ 0x7f63b2f38840] mb I  I16..4: 62.6% 32.6%  4.8%
[libx264 @ 0x7f63b2f38840] mb P  I16..4:  3.0%  0.8%  0.2%  P16..4:  3.9%  0.3%  0.0%  0.0%  0.0%    skip:91.7%
[libx264 @ 0x7f63b2f38840] mb B  I16..4:  0.1%  0.0%  0.0%  B16..8:  2.9%  0.0%  0.0%  direct: 0.0%  skip:96.9%  L0:46.2% L1:52.9% BI: 0.9%
[libx264 @ 0x7f63b2f38840] 8x8 transform intra:25.4% inter:73.2%
[libx264 @ 0x7f63b2f38840] coded y,u,v intra: 2.8% 2.3% 2.5% inter: 0.0% 0.0% 0.0%
[libx264 @ 0x7f63b2f38840] i16 v,h,dc,p: 78% 18%  0%  4%
[libx264 @ 0x7f63b2f38840] i8 v,h,dc,ddl,ddr,vr,hd,vl,hu: 42% 18% 40%  0%  0%  0%  0%  0%  0%
[libx264 @ 0x7f63b2f38840] i4 v,h,dc,ddl,ddr,vr,hd,vl,hu: 20% 50% 26%  1%  0%  1%  0%  1%  0%
[libx264 @ 0x7f63b2f38840] Weighted P-Frames: Y:0.0% UV:0.0%
[libx264 @ 0x7f63b2f38840] ref P L0: 64.6%  1.1% 23.6% 10.7%
[libx264 @ 0x7f63b2f38840] ref B L0: 87.5% 11.3%  1.2%
[libx264 @ 0x7f63b2f38840] ref B L1: 96.9%  3.1%
[libx264 @ 0x7f63b2f38840] kb/s:94.15
Completed
total 124K   
-rw-r--r--    1 root     root      119.9K Jun 19 19:35 test-video.mp4
-rw-r--r--    1 root     root          28 Jun 19 19:29 test.txt
