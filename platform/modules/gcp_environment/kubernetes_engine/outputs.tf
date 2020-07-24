output "gcloud_cluster_get_credentials_command" {
  value = "gcloud container clusters get-credentials ${module.gke.name} --zone ${data.google_client_config.current.zone} --project ${data.google_client_config.current.project}"
}