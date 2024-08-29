variable "project_id" {
  description = "The ID of the GCP project."
  type        = string
}

variable "region" {
  description = "The GCP region to deploy the Cloud Run service."
  type        = string
  default     = "us-central1"
}

variable "api_service_name" {
  description = "The name of the Cloud Run service."
  type        = string
}

variable "web_service_name" {
  description = "The name of the Cloud Run service."
  type        = string
}

variable "api_container_image" {
  description = "The Docker container image URL (gcr.io/project-id/image-name:tag)."
  type        = string
}


variable "web_container_image" {
  description = "The Docker container image URL (gcr.io/project-id/image-name:tag)."
  type        = string
}

variable "memory" {
  description = "Memory allocation for the Cloud Run container."
  type        = string
  default     = "1Gi"
}

variable "cpu" {
  description = "CPU allocation for the Cloud Run container."
  type        = string
  default     = "1"
}

variable "invoker_member" {
  description = "The member who can invoke the service (e.g., allUsers or specific IAM role)."
  type        = string
  default     = "allUsers"
}

variable "port" {
  description = "The port number on which the container listens."
  type        = number
  default     = 443
}

variable "model_service_account_name" {
  description = "The name of the service account to create."
  type        = string
  default     = "model-api-service-account"
}
variable "model_service_account_run_role" {
  description = "The role to grant to the service account."
  type        = string
  default     = "roles/run.admin"
}
variable "model_service_account_storage_role" {
  description = "The role to grant to the service account."
  type        = string
  default     = "roles/storage.admin"
}

variable "bucket_name" {
  description = "The name of the GCS bucket."
  type        = string
}

variable "force_destroy" {
  description = "Whether to force destroy the bucket."
  type        = bool
  default     = true
}

variable "api_subdomain_url" {
  description = "The subdomain URL of the Cloud Run service."
  type        = string
}

variable "web_subdomain_url" {
  description = "The subdomain URL of the Cloud Run service."
  type        = string
}