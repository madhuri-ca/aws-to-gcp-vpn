variable "vpc_id" {
  description = "AWS VPC ID."
  type        = string
}

variable "cidr_block" {
  description = "CIDR Block."
  type        = string
}

variable "public_subnet_id" {
  description = "Public Subnet ID."
  type        = string
}

variable "key_name" {
  description = "AWS Key Pair for SSH to VM."
  type        = string
}
