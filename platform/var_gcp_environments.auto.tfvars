# Using a list waiting for for_each support in modules coming with terraform 0.13
gcp_environments = [
  {
    name                = "dev",
    resources_namespace = "borg",

    region = "europe-west2",
  }
]