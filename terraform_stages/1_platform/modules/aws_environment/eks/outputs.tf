output "update_kubeconfig_command" {
  value = "aws eks update-kubeconfig --name ${local.naming_prefix}-eks-cluster --region eu-west-1 --role-arn ${aws_iam_role.eks_administrators.arn}"
}