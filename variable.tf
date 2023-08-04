variable "project_id" {
  description = "The ID of the Google Cloud project"
  type        = string
  default     = "nifty-altar-394805"
}


variable "region" {
  description = "The region for the GKE cluster"
  type        = string
  default     = "us-east1"
}

variable "cluster_location" {
  description = "The location for the GKE cluster"
  type        = string
  default     = "us-east1-b"
}
variable "cluster_name" {
   description = "Name of the cluster"
   type        = string
   default     = "gke_cluster"
}

variable "account_id" {
   description = "service account id"
   type        =  string
   default     =  "github-action-sa"
}

variable "jumphost_name" {
  description = "Instance name"
  type        = string
  default     =  "jumphost"
}

variable "vpc_cidr" {
  type    = string
  default =  "10.0.0.0/24"
}

variable "vpc" {
  type    = string
  default = "vpc1"
}

variable "subnet" {
  type    = string
  default = "subnet1"
}

variable "firewall_name" {
  type = string
  default = "new-firewall"
}
variable "network" {
  type = string
  default = "vpc1"
}

variable "subnetwork" {
  type = string
  default = "subnet1"
}
