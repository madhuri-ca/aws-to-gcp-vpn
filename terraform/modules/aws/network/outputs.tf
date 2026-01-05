output "vpc_id" {
  description = "The ID of the VPC."
  value       = aws_vpc.main.id
}

output "public_subnet_id" {
  description = "Public Subnet IDs."
  value       = aws_subnet.public.id
}