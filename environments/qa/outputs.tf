output "cloud_run_url" {
  description = "The URL of the deployed Cloud Run service in the dev environment."
  value       = module.cloud_run_service.cloud_run_url
}