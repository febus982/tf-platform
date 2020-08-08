variable "subnet_ids" {
  type = list(string)
}

variable "vpc_id" {
  type = string
}

variable "kubernetes_version" {
  type    = string
  default = "1.17"
}

variable "environment_name" {
  type = string
}

variable "resources_namespace" {
  type = string
}
