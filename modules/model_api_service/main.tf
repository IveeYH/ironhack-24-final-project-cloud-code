resource "google_service_account" "model_service_account" {
  account_id = var.model_service_account_name
  project    = var.project_id

  
}

resource "google_project_iam_binding" "model_service_account" {
  project = var.project_id
  role    = "roles/iam.serviceAccountUser"

  members = [
    "serviceAccount:${google_service_account.model_service_account.email}",
  ]
}

resource "google_project_iam_binding" "cloud_run_sa_role" {
  project = var.project_id
  role    = var.model_service_account_run_role

  members = [
    "serviceAccount:${google_service_account.model_service_account.email}",
  ]
}

resource "google_project_iam_binding" "storage_sa_role" {
  project = var.project_id
  role    = var.model_service_account_storage_role

  members = [
    "serviceAccount:${google_service_account.model_service_account.email}",
  ]
}

resource "google_cloud_run_service" "ml_api_service" {
  name     = var.api_service_name
  location = var.region

  template {
    spec {
      service_account_name = var.model_service_account_name
      containers {
        image = var.api_container_image

        ports {
          container_port = var.port
        }

        resources {
          limits = {
            memory = var.memory
            cpu    = var.cpu
          }
        }

        env {
          name  = "GCS_BUCKET_NAME"
          value = var.bucket_name
        }
        env {
          name  = "GCS_MODEL_PATH"
          value = "models"
        }
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }

  autogenerate_revision_name = true
}


resource "google_cloud_run_service" "web_service" {
  name     = var.web_service_name
  location = var.region


  template {
    spec {
      service_account_name = var.model_service_account_name
      containers {
        image = var.web_container_image

        ports {
          container_port = var.port
        }

        resources {
          limits = {
            memory = var.memory
            cpu    = var.cpu
          }
        }

        env {
          name  = "REACT_APP_API_BASE_URL"
          value = var.api_subdomain_url
        }
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
  
  autogenerate_revision_name = true
}

resource "google_cloud_run_domain_mapping" "api_domain_mapping" {
  location = var.region
  name     = var.api_subdomain_url

  metadata {
    namespace = var.project_id
  }

  spec {
    route_name = google_cloud_run_service.ml_api_service.name
  }
}

resource "google_cloud_run_domain_mapping" "web_domain_mapping" {
  location = var.region
  name     = var.web_subdomain_url

  metadata {
    namespace = var.project_id
  }

  spec {
    route_name = google_cloud_run_service.web_service.name
  }
}

resource "google_cloud_run_service_iam_member" "api_invoker" {
  location    = google_cloud_run_service.ml_api_service.location
  project     = google_cloud_run_service.ml_api_service.project
  service     = google_cloud_run_service.ml_api_service.name
  role        = "roles/run.invoker"
  member      = var.invoker_member
}

resource "google_cloud_run_service_iam_member" "web_invoker" {
  location    = google_cloud_run_service.web_service.location
  project     = google_cloud_run_service.web_service.project
  service     = google_cloud_run_service.web_service.name
  role        = "roles/run.invoker"
  member      = var.invoker_member
}

resource "google_storage_bucket" "trained_model_bucket" {
  name          = var.bucket_name
  location      = var.region
  force_destroy = var.force_destroy
}