module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "${local.naming_prefix}-vpc"
  cidr = var.vpc_cidr

  azs             = var.azs
  public_subnets  = slice(local.public_cidrs, 0, length(var.azs))
  private_subnets = slice(local.private_cidrs, 0, length(var.azs))

  enable_nat_gateway = true

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

resource "aws_subnet" "isolated_subnet" {
  count             = length(slice(local.isolated_cidrs, 0, length(var.azs)))
  cidr_block        = local.isolated_cidrs[count.index]
  vpc_id            = module.vpc.vpc_id
  availability_zone = var.azs[count.index]
  tags = {
    Name        = "${local.naming_prefix}-vpc-isolated-${var.azs[count.index]}"
    Terraform   = "true"
    Environment = "dev"
  }
}