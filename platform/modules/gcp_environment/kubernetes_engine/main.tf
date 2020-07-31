data "google_client_config" "current" {}

module "gke" {
  //  source  = "terraform-google-modules/kubernetes-engine/google//modules/safer-cluster"
  source = "terraform-google-modules/kubernetes-engine/google//modules/beta-public-cluster"

  project_id               = data.google_client_config.current.project
  name                     = "${local.naming_prefix}-cluster"
  region                   = var.subnet.subnet_region
  zones                    = ["${var.subnet.subnet_region}-a"]
  regional                 = false
  network                  = var.network
  subnetwork               = var.subnet.subnet_name
  ip_range_pods            = var.subnet.subnet_ip_range_pods_name
  ip_range_services        = var.subnet.subnet_ip_range_service_name
  remove_default_node_pool = true

  release_channel                    = var.release_channel
  enable_resource_consumption_export = var.enable_resource_consumption_export
  enable_shielded_nodes              = var.enable_shielded_nodes
  horizontal_pod_autoscaling         = var.horizontal_pod_autoscaling
  enable_vertical_pod_autoscaling    = var.enable_vertical_pod_autoscaling
  gce_pd_csi_driver                  = var.gce_pd_csi_driver # Google Compute Engine Persistent Disk Container Storage Interface (CSI) Driver
  enable_pod_security_policy         = var.enable_pod_security_policy
  istio                              = var.istio
  cloudrun                           = var.cloudrun
  dns_cache                          = var.dns_cache

  cluster_autoscaling = var.cluster_autoscaling

  node_pools = [for pool in var.node_pools :
    merge(local.gke_node_pools_defaults, pool)
  ]

  //  node_pools_oauth_scopes = {
  //    all = [
  //      "https://www.googleapis.com/auth/cloud-platform",
  //    ]
  //    default-node-pool = []
  //  }

  //  node_pools_labels = {
  //    all = {}
  //
  //    default-node-pool = {
  //      default-node-pool = true
  //    }
  //  }
  //
  //  node_pools_metadata = {
  //    all = {}
  //
  //    default-node-pool = {
  //      node-pool-metadata-custom-value = "my-node-pool"
  //    }
  //  }
  //
  //  node_pools_tags = {
  //    all = []
  //
  //    default-node-pool = [
  //      "default-node-pool",
  //    ]
  //  }
}
