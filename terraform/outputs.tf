output "namespace" {

  value = kubernetes_namespace.ai_forgestream.metadata[0].name

}

output "pvc_name" {

  value = kubernetes_persistent_volume_claim.media_storage.metadata[0].name

}

output "service_account" {

  value = kubernetes_service_account.api_sa.metadata[0].name

}

output "role_name" {

  value = kubernetes_role.job_manager_role.metadata[0].name

}