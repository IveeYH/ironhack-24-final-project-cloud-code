resource "google_artifact_registry_repository" "ml_api_repository" {
  project       = var.project_id
  location      = var.region
  repository_id = var.repository_id
  format        = "DOCKER"

  description = "Docker repository for storing container images"

  docker_config {
    immutable_tags = false
  }
}

resource "google_service_account" "gar_access_service_account" {
  account_id   = var.gh_action_service_account_id
  display_name = var.gh_action_service_account_name
}

resource "google_project_iam_binding" "gh_action_access_service_account_iam" {
  project     = var.project_id
  role        = "roles/iam.serviceAccountUser"
  
  members     = [
    "serviceAccount:${google_service_account.gar_access_service_account.email}"
  ]
}

resource "google_project_iam_binding" "gar_gh_action_service_account_iam" {
  project     = var.project_id
  role        = var.gh_action_ar_service_account_role

  members     = [
    "serviceAccount:${google_service_account.gar_access_service_account.email}"
  ]
}

resource "google_project_iam_binding" "run_gh_action_service_account_iam" {
  project     = var.project_id
  role        = var.gh_action_run_service_account_role
  
  members     = [
    "serviceAccount:${google_service_account.gar_access_service_account.email}"
  ]
}

resource "google_service_account_key" "gar_access_service_account_key" {
  service_account_id = google_service_account.gar_access_service_account.name
  public_key_type    = var.gh_action_service_account_public_key_type

  depends_on = [ google_service_account.gar_access_service_account ]
}

resource "local_file" "gar_access_service_account_key_file" {
  content  = google_service_account_key.gar_access_service_account_key.private_key
  filename = var.gh_action_service_account_key_file_path

  depends_on = [ google_service_account_key.gar_access_service_account_key ]
}
