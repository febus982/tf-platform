########### GCP environments ###############
# only one supported until terraform v0.13
module "gcp_environment" {
  source = "./modules/gcp_environment"

  environment_name    = var.environments[0].name
  resources_namespace = var.environments[0].resources_namespace

  region = var.environments[0].gcp_region
}

########### AWS environments ###############
# only one supported until terraform v0.13
//module "aws_environment" {
//  source = "./modules/aws_environment"
//
//  environment_name    = var.aws_environments[0].name
//  resources_namespace = var.aws_environments[0].resources_namespace
//
//  region = var.aws_environments[0].regionw
//}
//
//output "aws_update_kubeconfig_command" {
//  value = module.aws_environment.update_kubeconfig_command
//}
