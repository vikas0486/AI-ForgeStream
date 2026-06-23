resource "kubernetes_namespace" "ai_forgestream" {

  metadata {
    name = "ai-forgestream"
  }

}