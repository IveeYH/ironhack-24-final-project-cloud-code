output "artifact_id" {
  description = "an identifier for the resource"
  value       = google_artifact_registry_repository.ml_api_repository.id
}