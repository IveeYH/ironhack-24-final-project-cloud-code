variable "environment_code" {
  description = "The environment of the GCP project."
  type        = string
  default     = "dev"
}

variable "project_id" {
  description = "The ID of the GCP project."
  type        = string
}

variable "region" {
  description = "The GCP region to deploy the Cloud Run service."
  type        = string
  default     = "europe-west1"
}

variable "api_service_name" {
  description = "The name of the Cloud Run service."
  type        = string
  default     = "ml-model-service-pro"
}

variable "web_service_name" {
  description = "The name of the Cloud Run service."
  type        = string
  default     = "web-service-pro"
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
  description = "The member who can invoke the service."
  type        = string
  default     = "allUsers"
}

variable "service_account_public_key_type" {
  description = "The type of the generated public keys."
  type        = string
  default     = "TYPE_NONE"
}

variable "domain_url" {
  description = "The domain URL of the Cloud Run service."
  type        = string
  default     = "ilodata.tech"
}

variable "subdomain_url" {
  description = "The subdomain URL of the Cloud Run service."
  type        = string
  default     = "small-molecule-protein-binding-affinity"
}