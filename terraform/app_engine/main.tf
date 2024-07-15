resource "google_storage_bucket" "app_bucket" {
  name          = var.bucket_name
  location      = "EU"
  force_destroy = true
}

resource "google_storage_bucket_object" "app_files" {
  name   = "app.zip"
  bucket = google_storage_bucket.app_bucket.name
  source = "../app.zip"
}

resource "google_app_engine_standard_app_version" "default" {
  service         = "default"
  version_id      = "v1"
  runtime         = "python39"
  entrypoint {
    shell = "gunicorn -b :$PORT app:app"
  }

  deployment {
    zip {
      source_url = "https://storage.googleapis.com/${google_storage_bucket.app_bucket.name}/${google_storage_bucket_object.app_files.name}"
    }
  }

  env_variables = {
    FLASK_ENV = "production"
  }
}
