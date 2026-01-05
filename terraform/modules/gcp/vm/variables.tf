variable "region" {
  description = "GCP Region."
  type        = string
}

variable "vpc_name" {
  description = "GCP VPC name."
  type        = string
}

variable "cidr_block" {
  description = "Allowed CIDR Block for Firewall"
  type        = string
}

variable "public_subnet_id" {
  description = "Public Subnet ID."
  type        = string
}
