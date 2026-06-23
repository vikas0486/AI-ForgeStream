resource "kubernetes_config_map" "ffmpeg_config" {

  metadata {
    name      = "ffmpeg-config"
    namespace = kubernetes_namespace.ai_forgestream.metadata[0].name
  }

  data = {
    VIDEO_CODEC   = "libx264"
    AUDIO_CODEC   = "aac"
    VIDEO_BITRATE = "2000k"
    AUDIO_BITRATE = "128k"
  }

}