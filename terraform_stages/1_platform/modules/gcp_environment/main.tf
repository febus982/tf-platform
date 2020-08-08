module "vpc" {
  source = "./vpc"

  environment_name    = var.environment_name
  resources_namespace = var.resources_namespace
}

module "kubernetes_engine" {
  source = "./gke_cluster"

  environment_name    = var.environment_name
  resources_namespace = var.resources_namespace

  network = module.vpc.network_name
  subnet  = module.vpc.gke_subnet_info
}
