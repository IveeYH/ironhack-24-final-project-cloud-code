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