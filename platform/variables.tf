variable "aws_environments" {
  type = list(object({
    resources_namespace = string
    name                = string
    region              = string
  }))
}

variable "gcp_environments" {
  type = list(object({
    resources_namespace = string
    name                = string
    region              = string
  }))
}
