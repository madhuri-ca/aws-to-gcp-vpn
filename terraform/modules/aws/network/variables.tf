variable "region" {
  description = "AWS region."
  type        = string
}

variable "cidr_block" {
  type        = string
  description = "VPC CIDR Block"
}

variable "vgw_id" {
  description = "AWS VPN Gateway ID."
  type        = string
}
