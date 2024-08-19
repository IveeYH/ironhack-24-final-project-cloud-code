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