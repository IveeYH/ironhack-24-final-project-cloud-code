provider "google" {
  project = var.project_id
  region  = var.region
}

module "artifact_registry" {
  source = "../../modules/artifact_registry"

  project_id                                = var.project_id
  region                                    = var.region
  repository_id                             = "repository-${var.project_id}-${var.environment_code}"
  gh_action_service_account_id              = "sa-gar-gh-action-${var.environment_code}"
  gh_action_service_account_name            = "GitHub Actions service account for ${var.project_id}-${var.environment_code}"
  gh_action_service_account_public_key_type = var.service_account_public_key_type
}

module "model_api_service" {
  source = "../../modules/model_api_service"

  project_id            = var.project_id
  region                = var.region
  api_service_name      = var.api_service_name
  api_container_image   = "${var.region}-docker.pkg.dev/${var.project_id}/repository-${var.project_id}-${var.environment_code}/small-molecule-protein-binding-affinity-api-${var.environment_code}:latest"
  web_service_name      = var.web_service_name
  web_container_image   = "${var.region}-docker.pkg.dev/${var.project_id}/repository-${var.project_id}-${var.environment_code}/small-molecule-protein-binding-affinity-web-${var.environment_code}:latest"
  memory                = var.memory
  cpu                   = var.cpu
  invoker_member        = var.invoker_member
  bucket_name           = "bucket-artifacts-${var.project_id}-${var.environment_code}"
  force_destroy         = true
  api_subdomain_url     = "${var.environment_code}.api.${var.subdomain_url}.${var.domain_url}"
  web_subdomain_url     = "${var.environment_code}.web.${var.subdomain_url}.${var.domain_url}"
}