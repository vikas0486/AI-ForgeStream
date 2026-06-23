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

    resources = [
      "jobs"
    ]

    verbs = [
      "get",
      "list",
      "watch",
      "create",
      "update",
      "patch",
      "delete"
    ]
  }

  rule {
    api_groups = [""]

    resources = [
      "pods",
      "pods/log"
    ]

    verbs = [
      "get",
      "list",
      "watch"
    ]
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