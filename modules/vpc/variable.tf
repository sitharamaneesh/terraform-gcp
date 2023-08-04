variable "region" {
  description = "The region for the GKE cluster"
  type        = string
}
variable "project" {
  description = "The ID of the Google Cloud project"
  type        = string
}
variable "vpc_name" {
  description = "Name of vpc"
  type = string
}
variable "subnet_name" {
  description = "Subnet name"
  type = string
}

variable "firewall_name" {
  description = "Firewall name"
  type = string
}
variable "ip_cidr_range" {
  description = "cidr range"
  type = string
}

variable "network" {
  description = "VPC network"
 }



