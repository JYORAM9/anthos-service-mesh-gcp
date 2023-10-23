resource "google_gke_hub_membership" "membership" {
  membership_id = "membership"
  project       = var.project_id
  endpoint {
    gke_cluster {
      resource_link = data.terraform_remote_state.gke_terraform_cluster.outputs.cluster_id
    }
  }
  authority {
    issuer = "https://container.googleapis.com/v1/${data.terraform_remote_state.gke_terraform_cluster.outputs.cluster_id}"
  }
}




resource "google_gke_hub_feature" "feature" {
  name     = "configmanagement"
  project  = var.project_id
  location = "global"
  provider = google-beta
}


