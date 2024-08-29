output "cloud_run_url" {
  description = "The URL of the deployed Cloud Run service."
  value       = google_cloud_run_service.ml_api_service.status[0].url
}

output "api_domain_type" {
  description = "The domain mapping of the Cloud Run service."
  value       = google_cloud_run_domain_mapping.api_domain_mapping.status[0].resource_records[0].type
  
}
output "api_domain_name" {
  description = "The domain mapping of the Cloud Run service."
  value       = google_cloud_run_domain_mapping.api_domain_mapping.status[0].resource_records[0].name
  
}

output "web_domain_type" {
  description = "The domain mapping of the Cloud Run service."
  value       = google_cloud_run_domain_mapping.web_domain_mapping.status[0].resource_records[0].type
  
}
output "web_domain_name" {
  description = "The domain mapping of the Cloud Run service."
  value       = google_cloud_run_domain_mapping.web_domain_mapping.status[0].resource_records[0].name
  
}