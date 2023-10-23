data "terraform_remote_state" "gke_terraform_cluster" {
  backend = "remote"
  config = {
    organization = "jyo"
    workspaces = {
      name = "gke-terraform-project"
    }
  }
}