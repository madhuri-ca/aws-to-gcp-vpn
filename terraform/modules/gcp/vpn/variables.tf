variable "gcp_vpc_self_link" {
  description = "VPC Self Link."
  type        = string
}

variable "gcp_region" {
  description = "GCP region."
  type        = string
}

variable "gcp_asn" {
  description = "GCP Router BGP ASN."
  type        = number
}

variable "aws_asn" {
  description = "AWS Router BGP ASN."
  type        = number
}

variable "aws_vpn_connections" {
  description = "AWS VPN Connections"
}
