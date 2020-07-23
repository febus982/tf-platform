provider "google" {
  version = "3.5.0"

  credentials = file("credentials/gcp.json")

  region  = "europe-west2"
  zone    = "europe-west2-a"
}

provider "aws" {
  region  = "eu-west-1"
  profile = "personal"
}