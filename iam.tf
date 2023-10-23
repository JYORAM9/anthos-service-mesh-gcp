## Reference: https://github.com/terraform-google-modules/terraform-google-kubernetes-engine/blob/v27.0.0/modules/fleet-membership/main.tf
## Give the service agent permissions on hub project
resource "google_project_iam_member" "hub_service_agent_gke" {
  count   = var.project_id == "" ? 0 : 1
  project = var.project_id
  role    = "roles/gkehub.serviceAgent"
  member  = "serviceAccount:${google_project_service_identity.sa_gkehub[0].email}"
}

resource "google_project_service_identity" "sa_gkehub" {
  count    = var.project_id == "" ? 0 : 1
  provider = google-beta
  project  = var.project_id
  service  = "gkehub.googleapis.com"
}

# output "hub_service_agent_gke" {
#   value = google_project_iam_member.hub_service_agent_gke[0].id
# }
# output "sa_gkehub" {
#   value = google_project_service_identity.sa_gkehub[0].email
# }