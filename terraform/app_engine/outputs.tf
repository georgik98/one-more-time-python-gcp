output "app_engine_url" {
  value = "https://${google_app_engine_standard_app_version.default.service}.appspot.com"
}