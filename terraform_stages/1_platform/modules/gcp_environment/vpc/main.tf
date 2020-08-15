data "google_client_config" "current" {}

module "vpc" {
  source  = "github.com/terraform-google-modules/terraform-google-network"
//  source  = "terraform-google-modules/network/google"
//  version = "~> 2.4"

  project_id   = data.google_client_config.current.project
  network_name = "${local.naming_prefix}-vpc"
  routing_mode = "REGIONAL"

  subnets = [
    {
      subnet_name   = var.gke_subnet.subnet_name
      subnet_ip     = var.gke_subnet.subnet_main_cidr
      subnet_region = var.gke_subnet.subnet_region
      description   = var.gke_subnet.description
    },
  ]

  secondary_ranges = {
    (var.gke_subnet.subnet_name) = [
      {
        range_name    = "${var.gke_subnet.subnet_name}-pods"
        ip_cidr_range = var.gke_subnet.subnet_pod_cidr
      },
      {
        range_name    = "${var.gke_subnet.subnet_name}-services"
        ip_cidr_range = var.gke_subnet.subnet_service_cidr
      },
    ]
  }

}

