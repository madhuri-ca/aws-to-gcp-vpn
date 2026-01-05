
# VPC
resource "google_compute_network" "main" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
  routing_mode            = "GLOBAL"
}

# Public Subnet
resource "google_compute_subnetwork" "public" {
  name          = "public-subnet"
  ip_cidr_range = var.cidr_block
  network       = google_compute_network.main.self_link
  region        = var.region
}
