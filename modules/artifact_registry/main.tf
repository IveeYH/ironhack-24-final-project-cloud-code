resource "google_artifact_registry_repository" "ml_api_repository" {
  project       = var.project_id
  location      = var.region
  repository_id = var.repository_id
  format        = "DOCKER"

  description = "Docker repository for storing container images"

  docker_config {
    immutable_tags = true
  }
}