output "repository_name" {
  value = google_artifact_registry_repository.ac-repository.name
}
output "repository_location" {
  value = google_artifact_registry_repository.ac-repository.location
}
output "cluster_name" {
  description = "Name of the GKE Autopilot cluster"
  value       = google_container_cluster.ac-cluster.name
}

output "cluster_endpoint" {
  description = "Endpoint of the GKE Autopilot cluster"
  value       = google_container_cluster.ac-cluster.endpoint
}

output "cluster_master_version" {
  description = "Master version of the GKE Autopilot cluster"
  value       = google_container_cluster.ac-cluster.master_version
}

output "cluster_location" {
  description = "Location of the GKE Autopilot cluster"
  value       = google_container_cluster.ac-cluster.location
}