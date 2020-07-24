module "gcp_environment" {
  source = "./modules/gcp_environment"

  environment_name    = var.environment_name
  resources_namespace = var.resources_namespace
}

output "gcloud_cluster_get_credentials_command" {
  value = module.gcp_environment.gcloud_cluster_get_credentials_command
}

//module "aws_environment" {
//  source = "./modules/aws_environment"
//
//  environment_name    = var.environment_name
//  resources_namespace = var.resources_namespace
//}
//
//output "aws_update_kubeconfig_command" {
//  value = module.aws_environment.update_kubeconfig_command
//}