# create VPC
resource "google_compute_network" "vpc" {
  name                    = "vpc1"
  auto_create_subnetworks = false
}

# Create Subnet
resource "google_compute_subnetwork" "subnet" {
  name          = "subnet1"
  region        = var.region
  network       = google_compute_network.vpc.name
  ip_cidr_range = "10.0.0.0/24"
  private_ip_google_access = true
}

# # Create Service Account
# resource "google_service_account" "mysa" {
#   account_id   = "mysa"
#   display_name = "Service Account for GKE nodes"
# }


# Create GKE cluster with 2 nodes in our custom VPC/Subnet
resource "google_container_cluster" "primary" {
  name                     = "my-gke-cluster"
  location                 = var.cluster_location
  network                  = google_compute_network.vpc.name
  subnetwork               = google_compute_subnetwork.subnet.name
  remove_default_node_pool = true ## create the smallest possible default node pool and immediately delete it.
  # networking_mode          = "VPC_NATIVE" 
  initial_node_count = 1

  private_cluster_config {
    enable_private_endpoint = true
    enable_private_nodes    = true
    master_ipv4_cidr_block  = "10.13.0.0/28"
  }
  ip_allocation_policy {
    cluster_ipv4_cidr_block  = "10.11.0.0/21"
    services_ipv4_cidr_block = "10.12.0.0/21"
  }
  master_authorized_networks_config {
    cidr_blocks {
      cidr_block   = "10.0.0.7/32"
      display_name = "net1"
    }

  }
}

# Create managed node pool
resource "google_container_node_pool" "primary_nodes" {
  name       = google_container_cluster.primary.name
  location   = var.cluster_location
  cluster    = google_container_cluster.primary.name
  node_count = 3
  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

    labels = {
      env = "dev"
    }

    machine_type = "e2-medium"
    disk_size_gb   = 30
    preemptible  = true
    #service_account = google_service_account.mysa.email

    metadata = {
      disable-legacy-endpoints = "true"
    }
  }
}




resource "google_artifact_registry_repository" "my-repo" {
#  provider      = google-beta
  project       = var.project_id
  location      = var.region
  repository_id = "my-repository"
  description   = "example docker repository"
  format        = "DOCKER"
}


## Create jump host . We will allow this jump host to access GKE cluster. the ip of this jump host is already authorized to allowin the GKE cluster


# Create a RHEL instance
resource "google_compute_instance" "rhel_instance" {
  name         = "jump-host"
  machine_type = "e2-medium"
  zone             = var.cluster_location 
  tags         = ["rhel"]
 
  boot_disk {
    initialize_params {
      image = "rhel-cloud/rhel-9"
    }
  }

  network_interface {
    network = google_compute_network.vpc.name
   subnetwork        = google_compute_subnetwork.subnet.name
    access_config {
    }
  }
}

## Creare Firewall to access jump hist via iap


resource "google_compute_firewall" "rules" {
  project = var.project_id
  name    = "allow-ssh"
  network =  google_compute_network.vpc.name # Replace with a reference or self link to your network, in quotes

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["0.0.0.0/0"]
}


resource "google_service_account" "github-actions-workflow" {
      account_id   = "github-actions-workflow" 
      disabled     = false 
      display_name = "GitHub Actions workflow" 
      project      = var.project_id
    }
