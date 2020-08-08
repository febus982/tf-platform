# Note: this will be a remote state
terraform {
  backend "local" {
    path = "platform.tfstate"
  }
}
