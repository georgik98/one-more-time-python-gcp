variable "region" {
    type = string
    description = "The default region of app_engine app"
}

variable "bucket_name" {
  description = "The name of the Cloud Storage bucket to store the application files"
  type        = string
}