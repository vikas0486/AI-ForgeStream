terraform {
  required_version = ">= 1.0.0"
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config" # Connects to the local Kubernetes cluster
}

resource "kubernetes_namespace" "ai_forgestream" {
  metadata {
    name = "ai-forgestream"
  }
}

resource "kubernetes_persistent_volume_claim" "media_storage" {
  metadata {
    name      = "media-storage"
    namespace = kubernetes_namespace.ai_forgestream.metadata[0].name
  }
  spec {
    access_modes = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = "1Gi"
      }
    }
  }
}

resource "kubernetes_service_account" "api_sa" {
  metadata {
    name      = "ai-forgestream-api-sa"
    namespace = kubernetes_namespace.ai_forgestream.metadata[0].name
  }
}

resource "kubernetes_role" "job_manager_role" {
  metadata {
    name      = "job-manager-role"
    namespace = kubernetes_namespace.ai_forgestream.metadata[0].name
  }

  rule {
    api_groups = ["batch"]
    resources  = ["jobs"]
    verbs      = ["get", "list", "watch", "create", "update", "patch", "delete"]
  }

  rule {
    api_groups = [""]
    resources  = ["pods", "pods/log"]
    verbs      = ["get", "list", "watch"]
  }
}

resource "kubernetes_role_binding" "job_manager_binding" {
  metadata {
    name      = "job-manager-role-binding"
    namespace = kubernetes_namespace.ai_forgestream.metadata[0].name
  }

  subject {
    kind      = "ServiceAccount"
    name      = kubernetes_service_account.api_sa.metadata[0].name
    namespace = kubernetes_namespace.ai_forgestream.metadata[0].name
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "Role"
    name      = kubernetes_role.job_manager_role.metadata[0].name
  }
}

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

output "namespace" {
  value = kubernetes_namespace.ai_forgestream.metadata[0].name
}

output "pvc_name" {
  value = kubernetes_persistent_volume_claim.media_storage.metadata[0].name
}
