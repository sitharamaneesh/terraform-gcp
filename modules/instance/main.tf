# Create a RHEL instance
resource "google_compute_instance" "rhel_instance" {
  instance_name         = var.jumphost_name
  machine_type = "e2.medium"
  zone             = var.cluster_location 
  tags         = ["rhel"]
 
  boot_disk {
    initialize_params {
      image = "rhel-cloud/rhel-9"
    }
  }

  network_interface {
    network = "$(var.vpc)"
   subnetwork        = "$(var.subnet)"
    access_config {
    }
  }
} 
