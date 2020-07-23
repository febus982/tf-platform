module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "${local.naming_prefix}-vpc"
  cidr = var.vpc_cidr

  azs             = var.azs
  public_subnets  = var.public_cidrs
  private_subnets = var.private_cidrs

  enable_nat_gateway = true

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

resource "aws_subnet" "isolated_subnet" {
  count = length(var.isolated_cidrs)
  cidr_block = var.isolated_cidrs[count.index]
  vpc_id     = module.vpc.vpc_id
  availability_zone = var.azs[count.index]
  tags = {
    Name = "${local.naming_prefix}-vpc-isolated-${var.azs[count.index]}"
    Terraform   = "true"
    Environment = "dev"
  }
}