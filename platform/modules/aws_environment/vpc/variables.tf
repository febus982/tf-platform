variable "environment_name" {
  type = string
}

variable "resources_namespace" {
  type = string
}

variable "azs" {
  type = list(string)
}

variable "vpc_cidr" {
  type = string
}

variable "public_cidrs" {
  type = list(string)
}

variable "private_cidrs" {
  type = list(string)
}

variable "isolated_cidrs" {
  type = list(string)
}