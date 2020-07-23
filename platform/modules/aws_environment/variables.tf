variable "environment_name" {
  type = string
}

variable "resources_namespace" {
  type = string
}

############# VPC Config ##########
variable "azs" {
  type = list(string)
  default = [
    "eu-west-1a",
    "eu-west-1b",
    "eu-west-1c",
  ]
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public_cidrs" {
  type    = list(string)
  default = []
}

variable "private_cidrs" {
  type    = list(string)
  default = []
}

variable "isolated_cidrs" {
  type    = list(string)
  default = []
}

########### EKS Config ############

variable "kubernetes_version" {
  type = string
  default = "1.17"
}
