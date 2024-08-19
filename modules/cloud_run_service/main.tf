resource "google_cloud_run_service" "ml_api_service" {
  name     = var.service_name
  location = var.region

  template {
    spec {
      containers {
        image = var.container_image

        resources {
          limits = {
            memory = var.memory
            cpu    = var.cpu
          }
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

resource "google_cloud_run_service_iam_member" "invoker" {
  location    = google_cloud_run_service.ml_service.location
  project     = google_cloud_run_service.ml_service.project
  service     = google_cloud_run_service.ml_service.name
  role        = "roles/run.invoker"
  member      = var.invoker_member
}