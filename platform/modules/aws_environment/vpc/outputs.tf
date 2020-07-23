output "vpc_id" {
  value = module.vpc.vpc_id
}

output "subnet_ids" {
  value = {
    private  = module.vpc.private_subnets
    public   = module.vpc.public_subnets
    isolated = aws_subnet.isolated_subnet.*.id
  }
}