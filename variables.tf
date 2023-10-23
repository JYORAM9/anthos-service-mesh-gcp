variable "project_id" {
  type        = string
  description = "The project ID to host the cluster in"
  default     = ""
}
variable "region" {
  type        = string
  description = "The region to host the cluster in"
  default     = ""
}

variable "google_credentials" {
  type        = string
  description = "The gcp creds"
  default     = ""
}