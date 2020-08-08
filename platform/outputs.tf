### GCP outputs
output "gcloud_cluster_get_credentials_command" {
  value = module.gcp_environment.gcloud_cluster_get_credentials_command
}

output "gke_cluster_name" {
  value = module.gcp_environment.gke_cluster_name
}

output "gke_cluster_location" {
  value = module.gcp_environment.gke_cluster_location
}

