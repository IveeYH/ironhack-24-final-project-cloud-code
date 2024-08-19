provider "google" {
  project = var.project_id
  region  = var.region
}

module "cloud_run_service" {
  source = "../../modules/cloud_run_service"

  project_id      = var.project_id
  region          = var.region
  service_name    = var.service_name
  container_image = var.container_image
  memory          = var.memory
  cpu             = var.cpu
  invoker_member  = var.invoker_member
}

module "artifact_registry" {
  source = "../../modules/artifact_registry"

  project_id      = var.project_id
  region          = var.region
  repository_id   = "repository-${var.project_id}-${var.env}"
}