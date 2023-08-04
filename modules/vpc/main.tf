 resource "google_compute_network" "vpc" {
 vpc_name                    = var.vpc
  auto_create_subnetworks = false
}

# Create Subnet
resource "google_compute_subnetwork" "subnet" {
  subnet_name          = var.subnet
  region        = var.region
  network       = var.vpc
  ip_cidr_range = var.vpc_cidr
  private_ip_google_access = true
} 
resource "google_compute_firewall" "rules" {
  project = var.project_id
  firewall_name    = var.firewall_name
  network = var.vpc # Replace with a reference or self link to your network, in quotes

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["0.0.0.0/0"]
}
