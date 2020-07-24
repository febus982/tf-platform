provider "google-beta" {
  credentials = file("credentials/gcp.json")

  project = jsondecode(file("credentials/gcp.json")).project_id
  region  = "europe-west2"
  zone    = "europe-west2-a"
}


provider "google" {
  credentials = file("credentials/gcp.json")

  project = jsondecode(file("credentials/gcp.json")).project_id
  region  = "europe-west2"
  zone    = "europe-west2-a"
}


provider "aws" {
  region  = "eu-west-1"
  profile = "personal"
}