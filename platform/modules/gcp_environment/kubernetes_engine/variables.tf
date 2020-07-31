variable "environment_name" {
  type = string
}

variable "resources_namespace" {
  type = string
}

variable "network" {
  type = string
}

variable "subnet" {
  type = object({
    subnet_name                  = string
    subnet_ip_range_pods_name    = string
    subnet_ip_range_service_name = string
    subnet_region                = string
  })
}

variable "release_channel" {
  type    = string
  default = "RAPID"
}
variable "enable_resource_consumption_export" {
  type    = bool
  default = false
}
variable "enable_shielded_nodes" {
  type    = bool
  default = true
}
variable "horizontal_pod_autoscaling" {
  type    = bool
  default = true
}
variable "enable_vertical_pod_autoscaling" {
  type    = bool
  default = true
}
variable "gce_pd_csi_driver" {
  type    = bool
  default = false
}
variable "enable_pod_security_policy" {
  type    = bool
  default = false
}
variable "istio" {
  type    = bool
  default = false
}
variable "cloudrun" {
  type    = bool
  default = false
}
variable "dns_cache" {
  type    = bool
  default = false
}

variable "cluster_autoscaling" {
  type = object({
    enabled             = bool
    autoscaling_profile = string
    max_cpu_cores       = number
    min_cpu_cores       = number
    max_memory_gb       = number
    min_memory_gb       = number
  })

  default = {
    enabled             = false
    autoscaling_profile = "BALANCED"
    max_cpu_cores       = 0
    min_cpu_cores       = 0
    max_memory_gb       = 0
    min_memory_gb       = 0
  }
}

variable "node_pools" {
  type = list(map(string))

  default = [
    {
      name = "default-node-pool"
    }
  ]
}

