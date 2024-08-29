variable "project_id" {
  description = "The ID of the GCP project."
  type        = string
}

variable "region" {
  description = "The GCP region to deploy the Cloud Run service."
  type        = string
  default     = "us-central1"
}

variable "repository_id" {
  description = "The environment."
  type        = string
}

variable "gh_action_service_account_id" {
  description = "The ID of the service account to grant access to the bucket."
  type        = string
}

variable "gh_action_service_account_name" {
  description = "The name of the service account to grant access to the bucket."
  type        = string
}

variable "gh_action_ar_service_account_role" {
  description = "The role to grant to the service account."
  type        = string
  default     = "roles/artifactregistry.writer"
}

variable "gh_action_run_service_account_role" {
  description = "The role to grant to the service account."
  type        = string
  default     = "roles/run.admin"
}

variable "gh_action_service_account_public_key_type" {
  description = "The type of the public key."
  type        = string
  default     = "TYPE_X509_PEM_FILE"
}

variable "gh_action_service_account_key_file_path" {
  description = "The path to the service account key file."
  type        = string
  default     = "google-artifact-registry-access-service-account-key.json"
}