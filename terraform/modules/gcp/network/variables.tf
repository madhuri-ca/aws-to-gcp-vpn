variable "vpc_name" {
  description = "VPC network name "
  type        = string
}

variable "region" {
  description = "GCP Region."
  type        = string
}

variable "cidr_block" {
  description = "CIDR Block for Subnet."
  type        = string
}
