module "vpc" {
  source      = "./modules/vpc"
  vpc_name    = var.vpc
  subnet_name = var.subnet
  region      = var.region
  network     = var.vpc
  ip_cidr_range = var.vpc_cidr
  project       = var.project_id
  firewall_name = var.firewall_name
}

module "sa" {
  source       = "./modules/sa"
  account_id   = var.account_id
  display_name = var.account_id
  project_id      = var.project_id
}

module "registry" {
  source        = "./modules/registry"
  project       = var.project_id
  location      = var.region
  repository_id = "my-repository-$(var.region)"
  format        = "DOCKER"
}

module "instance" {
  source         = "./modules/instance"
  instance_name  = var.jumphost_name
  zone           = var.cluster_location 
}

module "gke" {
  source           = "./modules/gke"
#  name             = var.cluster_name
#  location         = var.cluster_location
#  network          = var.network
#  subnetwork       = var.subnetwork



# Create managed node pool
  nodepool_location   = var.cluster_location
  #cluster    = "$(var.cluster_name)"
}
