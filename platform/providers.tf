provider "google-beta" {
  credentials = file("credentials/gcp.json")
  project     = jsondecode(file("credentials/gcp.json")).project_id
}

provider "google" {
  credentials = file("credentials/gcp.json")
  project     = jsondecode(file("credentials/gcp.json")).project_id
}

provider "aws" {
  region  = "eu-west-1"
  profile = "personal"
}