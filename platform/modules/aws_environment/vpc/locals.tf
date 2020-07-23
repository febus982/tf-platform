locals {
  naming_prefix = "env-${var.environment_name}-${var.resources_namespace}"

  #### Automatic calculation of subnets for VPC with CIDR suffix = /16
  default_public_cidr_suffixes = [
    ".0.0/20",
    ".16.0/20",
    ".32.0/20",
    ".48.0/20",
    ".64.0/20",
  ]
  default_isolated_cidr_suffixes = [
    ".80.0/24",
    ".81.0/24",
    ".82.0/24",
    ".83.0/24",
    ".84.0/24",
  ]
  default_private_cidr_suffixes = [
    ".96.0/19",
    ".128.0/19",
    ".160.0/19",
    ".192.0/19",
    ".224.0/19",
  ]
  default_cidr_prefix = regexall("(\\d{1,3}\\.\\d{1,3})\\.\\d{1,3}\\.\\d{1,3}/16", var.vpc_cidr)
  private_cidrs       = length(var.private_cidrs) > 0 ? var.private_cidrs : [for s in local.default_private_cidr_suffixes : "${local.default_cidr_prefix[0][0]}${s}"]
  public_cidrs        = length(var.public_cidrs) > 0 ? var.public_cidrs : [for s in local.default_public_cidr_suffixes : "${local.default_cidr_prefix[0][0]}${s}"]
  isolated_cidrs      = length(var.isolated_cidrs) > 0 ? var.isolated_cidrs : [for s in local.default_isolated_cidr_suffixes : "${local.default_cidr_prefix[0][0]}${s}"]
}