output "cloud_run_url" {
  description = "The URL of the deployed Cloud Run service in the dev environment."
  value       = module.model_api_service.cloud_run_url
}

output "api_domain_type" {
  description = "The domain mapping of the Cloud Run service in the dev environment."
  value       = module.model_api_service.api_domain_type
}

output "api_domain_name" {
  description = "The domain mapping of the Cloud Run service in the dev environment."
  value       = module.model_api_service.api_domain_name
}

output "web_domain_type" {
  description = "The domain mapping of the Cloud Run service in the dev environment."
  value       = module.model_api_service.web_domain_type
}

output "web_domain_name" {
  description = "The domain mapping of the Cloud Run service in the dev environment."
  value       = module.model_api_service.web_domain_name
}