locals {
  naming_prefix = "env-${var.environment_name}-${var.resources_namespace}"

  gke_node_pools_defaults = {
    machine_type       = "e2-medium"
    min_count          = 1
    max_count          = 10
    local_ssd_count    = 0
    disk_size_gb       = 100
    disk_type          = "pd-standard"
    image_type         = "COS"
    auto_repair        = true
    auto_upgrade       = true
    preemptible        = true
    initial_node_count = 1
  }
}