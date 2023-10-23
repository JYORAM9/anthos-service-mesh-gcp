resource "google_gke_hub_feature_membership" "feature_member" {
  location   = "global"
  feature    = google_gke_hub_feature.feature.name
  membership = google_gke_hub_membership.membership.membership_id
  project    = data.terraform_remote_state.gke_terraform_cluster.outputs.project_id
  configmanagement {
    version = "1.15.3"
    config_sync {
      source_format = "unstructured"
      git {
        sync_repo   = "https://github.com/<github_username>/<repo_name>.git"
        sync_branch = "main"
        policy_dir  = "system/acm-terraform-blog-part1/config-root"
        secret_type = "none"
      }
    }
    policy_controller {
      enabled                    = true
      template_library_installed = true
      referential_rules_enabled  = true
    }
  }
  provider = google-beta
}