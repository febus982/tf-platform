variable "environment_name" {
  type = string
}

variable "resources_namespace" {
  type = string
}

variable "gke_subnet" {
  type = object({
    subnet_name         = string
    subnet_main_cidr    = string
    subnet_pod_cidr     = string
    subnet_service_cidr = string
    subnet_region       = string
    description         = string
  })

  default = {
    subnet_name         = "gke-subnet"
    subnet_main_cidr    = "10.0.0.0/17"
    subnet_pod_cidr     = "172.16.0.0/17"
    subnet_service_cidr = "172.16.128.0/17"
    subnet_region       = "europe-west2"
    description         = "This subnet is reserved for GKE cluster"
  }
}

