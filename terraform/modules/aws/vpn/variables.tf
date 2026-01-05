variable "aws_vpc_id" {
  description = "AWS VPC ID."
  type        = string
}

variable "aws_asn" {
  description = "AWS Router BGP ASN."
  type        = number
}

variable "gcp_asn" {
  description = "GCP Router BGP ASN."
  type        = number
}

variable "gcp_vpn_interface_ips" {
  description = "GCP HA VPN Gateway"
  type        = list(string)
}