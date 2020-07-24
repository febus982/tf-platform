data "google_client_config" "current" {}

module "gke" {
  //  source  = "terraform-google-modules/kubernetes-engine/google//modules/safer-cluster"
  source = "terraform-google-modules/kubernetes-engine/google//modules/beta-public-cluster"

  project_id                         = data.google_client_config.current.project
  name                               = "${local.naming_prefix}-cluster"
  region                             = var.gke_subnet.subnet_region
  zones                              = ["${var.gke_subnet.subnet_region}-a"]
  regional                           = false
  network                            = var.network
  subnetwork                         = var.gke_subnet.subnet_name
  ip_range_pods                      = var.gke_subnet.subnet_ip_range_pods_name
  ip_range_services                  = var.gke_subnet.subnet_ip_range_service_name
  remove_default_node_pool           = true
  enable_resource_consumption_export = false
  enable_shielded_nodes              = true

  gce_pd_csi_driver          = false # Google Compute Engine Persistent Disk Container Storage Interface (CSI) Driver
  enable_pod_security_policy = false

  cluster_autoscaling = {
    enabled             = false
    autoscaling_profile = "BALANCED"
    max_cpu_cores       = 0
    min_cpu_cores       = 0
    max_memory_gb       = 0
    min_memory_gb       = 0
  }

  release_channel                 = "RAPID"
  horizontal_pod_autoscaling      = true
  enable_vertical_pod_autoscaling = true

  node_pools = [
    {
      name               = "default-node-pool"
      machine_type       = "e2-medium"
      min_count          = 1
      max_count          = 2
      local_ssd_count    = 0
      disk_size_gb       = 100
      disk_type          = "pd-standard"
      image_type         = "COS"
      auto_repair        = true
      auto_upgrade       = true
      preemptible        = true
      initial_node_count = 1
    },
  ]

  node_pools_oauth_scopes = {
    all = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]

    default-node-pool = []
  }

  node_pools_labels = {
    all = {}

    default-node-pool = {
      default-node-pool = true
    }
  }

  node_pools_metadata = {
    all = {}

    default-node-pool = {
      node-pool-metadata-custom-value = "my-node-pool"
    }
  }

  node_pools_tags = {
    all = []

    default-node-pool = [
      "default-node-pool",
    ]
  }
}
