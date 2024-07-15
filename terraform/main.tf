provider "google" {
  project = var.project
  region  = var.region
  zone    = var.zone
}

terraform {
  backend "gcs" {
    bucket = "terraform-state-file-georgik16-new-python-v1"
    prefix = "terraform-state"
  }
}

module "app_engine" {
  source      = "./app_engine"
  region      = var.region
  bucket_name = var.bucket_name
}