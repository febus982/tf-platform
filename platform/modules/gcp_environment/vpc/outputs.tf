output "network_name" {
  value = module.vpc.network_name
}

output "gke_subnet_info" {
  value = {
    subnet_name                  = module.vpc.subnets_names[0]
    subnet_ip_range_pods_name    = "${var.gke_subnet.subnet_name}-pods"
    subnet_ip_range_service_name = "${var.gke_subnet.subnet_name}-services"
    subnet_region                = module.vpc.subnets_regions[0]
  }
}
