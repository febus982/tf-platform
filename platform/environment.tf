//module "gcp_environment" {
//  source = "./modules/gcp_environment"
//}

module "aws_environment" {
  source = "./modules/aws_environment"

  environment_name = var.environment_name
  resources_namespace = var.resources_namespace
}