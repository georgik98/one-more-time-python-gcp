provider "google" {
  project = var.project
  region  = var.region
  zone    = var.zone
}

terraform {
  backend "gcs" {
    bucket = var.bucket_name
    prefix = "terraform-state"
  }
}

module "app_engine" {
  source      = "./app_engine"
  region      = var.region
  bucket_name = var.bucket_name
}