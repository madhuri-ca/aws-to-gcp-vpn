output "vpc_self_link" {
  description = "VPC self-link."
  value       = google_compute_network.main.self_link
}

output "public_subnet_id" {
  description = "Public Subnet ID."
  value       = google_compute_subnetwork.public.id
}
