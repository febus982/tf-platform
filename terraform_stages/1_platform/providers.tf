provider "google-beta" {
  credentials = file("credentials/gcp.json")
  project     = jsondecode(file("credentials/gcp.json")).project_id
}

provider "google" {
  credentials = file("credentials/gcp.json")
  project     = jsondecode(file("credentials/gcp.json")).project_id
}

provider "aws" {}
