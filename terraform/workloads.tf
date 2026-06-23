resource "kubernetes_pod" "debug_pvc" {

  metadata {
    name      = "debug-pvc"
    namespace = kubernetes_namespace.ai_forgestream.metadata[0].name

    labels = {
      app = "debug"
    }
  }

  spec {

    container {

      name  = "debug"
      image = "alpine"

      command = [
        "sleep",
        "3600"
      ]

      volume_mount {
        name       = "media-storage"
        mount_path = "/data"
      }
    }

    volume {

      name = "media-storage"

      persistent_volume_claim {
        claim_name = kubernetes_persistent_volume_claim.media_storage.metadata[0].name
      }
    }
  }
}

resource "kubernetes_job" "ffmpeg_process" {

  metadata {
    name      = "ffmpeg-process-input"
    namespace = kubernetes_namespace.ai_forgestream.metadata[0].name
  }

  spec {

    backoff_limit = 1

    template {

      metadata {}

      spec {

        restart_policy = "Never"

        container {

          name  = "ffmpeg"
          image = "jrottenberg/ffmpeg:6.0-alpine"

          command = [
            "sh",
            "-c",
            <<-EOT
            echo "Terraform FFmpeg Job";
            ls -lah /data;
            EOT
          ]

          volume_mount {
            name       = "media-storage"
            mount_path = "/data"
          }
        }

        volume {

          name = "media-storage"

          persistent_volume_claim {
            claim_name = kubernetes_persistent_volume_claim.media_storage.metadata[0].name
          }
        }
      }
    }
  }
}