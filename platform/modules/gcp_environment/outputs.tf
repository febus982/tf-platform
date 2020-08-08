output "gcloud_cluster_get_credentials_command" {
  value = module.kubernetes_engine.gcloud_cluster_get_credentials_command
}

output "gke_cluster_name" {
  value = module.kubernetes_engine.gke_cluster_name
}

output "gke_cluster_location" {
  value = module.kubernetes_engine.gke_cluster_location
}
