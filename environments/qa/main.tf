provider "google" {
  project = var.project_id
  region  = var.region
}

module "artifact_registry" {
  source = "../../modules/artifact_registry"

  project_id      = var.project_id
  region          = var.region
  repository_id   = "repository-${var.project_id}-${var.env}"
}

module "cloud_run_service" {
  source = "../../modules/cloud_run_service"

  project_id      = var.project_id
  region          = var.region
  service_name    = var.service_name
  container_image = "${google_artifact_registry_repository.ml_api_repository.location}-docker.pkg.dev/${var.project_id}/ml-repo-${var.env}/your-image-name:latest"
  memory          = var.memory
  cpu             = var.cpu
  invoker_member  = var.invoker_member
}
