terraform {
  required_version = ">= 0.12"
}

provider "google" {
  region      = var.region
  project     = var.project_id
  credentials = file("cred.json")
}
