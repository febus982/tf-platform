variable "environment_name" {
  type = string
}

variable "resources_namespace" {
  type = string
}

variable "network" {
  type = string
}

variable "gke_subnet" {
  type = object({
    subnet_name                  = string
    subnet_ip_range_pods_name    = string
    subnet_ip_range_service_name = string
    subnet_region                = string
  })
}