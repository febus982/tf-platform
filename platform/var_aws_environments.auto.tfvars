# Using a list waiting for for_each support in modules coming with terraform 0.13
aws_environments = [
  {
    name                = "dev",
    resources_namespace = "borg",

    region = "eu-west-1",
  },
]