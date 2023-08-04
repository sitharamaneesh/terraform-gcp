variable "cluster_name" {
  description = "Name of the GKE cluster."
  type        = string
}

variable "cluster_location" {
  description = "Region where the GKE cluster will be deployed."
  type        = string
}

variable "network" {
  description = "Custom VPC network name where the GKE cluster will be created."
  type        = string
}

variable "subnetwork" {
  description = "Subnet name within the custom VPC where the GKE cluster will be created."
  type        = string
}

