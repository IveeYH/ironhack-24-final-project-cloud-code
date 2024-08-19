variable "project_id" {
  description = "The ID of the GCP project."
  type        = string
}

variable "region" {
  description = "The GCP region to deploy the Cloud Run service."
  type        = string
  default     = "us-central1"
}

variable "service_name" {
  description = "The name of the Cloud Run service."
  type        = string
}

variable "container_image" {
  description = "The Docker container image URL (gcr.io/project-id/image-name:tag)."
  type        = string
}

variable "memory" {
  description = "Memory allocation for the Cloud Run container."
  type        = string
  default     = "512Mi"
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