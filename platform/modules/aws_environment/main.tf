module "vpc" {
  source = "./vpc"

  environment_name    = var.environment_name
  resources_namespace = var.resources_namespace

  vpc_cidr       = var.vpc_cidr
  azs            = var.azs
  isolated_cidrs = var.isolated_cidrs
  private_cidrs  = var.private_cidrs
  public_cidrs   = var.public_cidrs
}

module "eks" {
  source = "./eks"

  environment_name    = var.environment_name
  resources_namespace = var.resources_namespace

  subnet_ids = module.vpc.subnet_ids.private
  vpc_id     = module.vpc.vpc_id
}