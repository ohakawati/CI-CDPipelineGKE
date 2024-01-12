#Creating gke cluster
resource "google_container_cluster" "ac-cluster" {
  name     = "ac-cluster"
  location = var.region
  ip_allocation_policy {
  }

  enable_autopilot = true
}
#Creating AR for docker images
resource "google_artifact_registry_repository" "ac-repository" {
  location      = var.region
  repository_id = "ac-repository"
  format        = "docker"
}
#Creating app repo in gcp
resource "google_sourcerepo_repository" "ac-repo-1" {
  name = "ac-repo-1"
}
#Creating env repo in gcp
resource "google_sourcerepo_repository" "ac-repo-2" {
  name = "ac-repo-2"
}
resource "google_cloudbuild_trigger" "ac-cluster-trigger" {
  location = "us-central1"

  trigger_template {
    branch_name = "*"
    repo_name   = "ac-repo-1"
  }

  substitutions = {
    _FOO = "bar"
    _BAZ = "qux"
  }

  filename = "cloudbuild-trigger-cd.yaml"
}
resource "google_cloudbuild_trigger" "ac-cluster-trigger-deploy" {
  location = "us-central1"

  trigger_template {
    branch_name = "canidate"
    repo_name   = "ac-repo-2"
  }

  substitutions = {
    _FOO = "bar"
    _BAZ = "qux"
  }

  filename = "cloudbuild-delivery.yaml"
}