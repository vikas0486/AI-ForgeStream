resource "kubernetes_persistent_volume_claim" "media_storage" {

  metadata {
    name      = "media-storage"
    namespace = kubernetes_namespace.ai_forgestream.metadata[0].name

    labels = {
      app  = "ai-forgestream"
      tier = "storage"
    }
  }

  spec {
    access_modes = ["ReadWriteOnce"]

    # 🔥 IMPORTANT: explicitly bind to your StorageClass
    storage_class_name = "standard"

    resources {
      requests = {
        storage = "1Gi"
      }
    }
  }

  # 🔥 IMPORTANT for Terraform stability in WaitForFirstConsumer clusters
  wait_until_bound = false
}