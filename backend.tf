terraform {
  cloud {
    organization = "jyo"
    workspaces {
      name = "anthos-service-mesh-gcp"
    }
  }
}