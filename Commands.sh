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

