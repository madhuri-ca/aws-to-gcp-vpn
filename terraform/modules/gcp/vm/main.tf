
# Images
data "google_compute_image" "ubuntu" {
  family  = "ubuntu-2204-lts"
  project = "ubuntu-os-cloud"
}

# Zones
data "google_compute_zones" "available" {
  region = var.region
}

# Virtual Machine (GCE)
resource "google_compute_instance" "vm" {
  name         = "vm-instance"
  machine_type = "e2-small"
  zone         = data.google_compute_zones.available.names[0]

  boot_disk {
    initialize_params {
      image = data.google_compute_image.ubuntu.name
    }
  }

  network_interface {
    subnetwork = var.public_subnet_id
    network    = var.vpc_name

    access_config {}
  }
}

# Firewall
resource "google_compute_firewall" "vm_firewall" {
  name    = "allow-iap-and-icmp"
  network = var.vpc_name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  allow {
    protocol = "icmp"
  }

  source_ranges = [
    "35.235.240.0/20",
    var.cidr_block,
  ]
}