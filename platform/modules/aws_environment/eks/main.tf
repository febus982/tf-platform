data "aws_eks_cluster" "cluster" {
  name = module.eks-cluster.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks-cluster.cluster_id
}

resource "aws_iam_role" "eks_administrators" {
  name = "eks_administrators"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "UserAssumeRole",
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::360064003702:user/Administrator"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.cluster.token
  load_config_file       = false
  version                = "~> 1.9"
}

module "eks-cluster" {
  create_eks = true

  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "${local.naming_prefix}-eks-cluster"
  cluster_version = var.kubernetes_version
  subnets         = var.subnet_ids
  vpc_id          = var.vpc_id
  manage_aws_auth = true

  map_roles = [
    {
      rolearn  = aws_iam_role.eks_administrators.arn
      username = "role1"
      groups   = ["system:masters"]
    },
  ]

  worker_groups = [
    {
      instance_type       = "t3a.large"
      asg_max_size        = 10
      suspended_processes = ["AZRebalance"]

      pre_userdata = local.pre_userdata
      additional_userdata = local.additional_userdata
      kubelet_extra_args  = "--node-labels=node.kubernetes.io/lifecycle=ondemand ${local.kubelet_tweaks}"

    },
  ]

  worker_groups_launch_template = [
    {
      name                    = "spot-1"
      override_instance_types = ["t3.large", "t3a.large", "m5.large", "m5a.large", "m5d.large", "m5ad.large"]
      suspended_processes = ["AZRebalance"]
      spot_instance_pools     = 6
      asg_max_size            = 10
      asg_desired_capacity    = 1
      kubelet_extra_args      = "--node-labels=node.kubernetes.io/lifecycle=spot ${local.kubelet_tweaks}"
      public_ip               = false
      pre_userdata = local.pre_userdata
      additional_userdata = local.additional_userdata
      kubelet_extra_args  = "--node-labels=node.kubernetes.io/lifecycle=spot ${local.kubelet_tweaks}"
    },
  ]
}
