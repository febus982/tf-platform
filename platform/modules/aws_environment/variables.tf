variable "environment_name" {
  type = string
}

variable "resources_namespace" {
  type = string
}

variable "azs" {
  type = list(string)
  default = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
}

variable "vpc_cidr" {
  type = string
  default = "10.0.0.0/16"
}

variable "public_cidrs" {
  type = list(string)
  default = [
    "10.0.0.0/20",
    "10.0.16.0/20",
    "10.0.32.0/20",
//    "10.0.48.0/20",
//    "10.0.64.0/20",
  ]
}

variable "private_cidrs" {
  type = list(string)
  default = [
    "10.0.96.0/19",
    "10.0.128.0/19",
    "10.0.160.0/19",
//    "10.0.192.0/19",
//    "10.0.224.0/19",
  ]
}

variable "isolated_cidrs" {
  type = list(string)
    default = [
    "10.0.80.0/24",
    "10.0.81.0/24",
    "10.0.82.0/24",
//    "10.0.83.0/24",
//    "10.0.84.0/24",
  ]
}