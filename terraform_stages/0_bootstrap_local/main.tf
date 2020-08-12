module "bootstrap" {
  source    = "vexingcodes/bootstrap/aws"
  version   = "1.0.0"
  s3_bucket = var.s3_bucket
  iam_group = var.iam_group
  iam_user = var.iam_user
  secret = var.secret
  dynamodb = var.dynamodb
}

