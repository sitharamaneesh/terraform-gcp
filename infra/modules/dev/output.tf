output "kubernetes_cluster_host" {
  value       = google_container_cluster.primary.endpoint
  description = "GKE Cluster Host"
}

output "kubernetes_cluster_name" {
  value       = google_container_cluster.primary.name
  description = "GKE Cluster Name"
}


output "vpc_name" {
  value       = google_compute_network.vpc.name
  description = "VPC Name"
}

output "subnet_name" {
  value       = google_compute_subnetwork.subnet.name
  description = "Subnet Name"
}


output "jump_host_ip" {
  value       = google_compute_instance.rhel_instance.network_interface[0].access_config[0].nat_ip
  description = "Jump Host IP"
}

output "repository_name" {
  value       = google_artifact_registry_repository.my-repo.repository_id
  description = "Artifact Repository Name"
}

output "firewall_name" {
  value       = google_compute_firewall.rules.name
  description = "Firewall Rule Name"
}
