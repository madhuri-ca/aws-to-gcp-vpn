
# AWS Network
module "aws_network" {
  source = "./modules/aws/network"

  cidr_block = cidrsubnet(var.cidr_block, 1, 0)
  region     = var.aws_region

  vgw_id = module.aws_vpn.vgw_id
}

# AWS Virtual Machine
module "aws_vm" {
  source = "./modules/aws/vm"

  cidr_block = var.cidr_block
  key_name   = var.key_name

  public_subnet_id = module.aws_network.public_subnet_id
  vpc_id           = module.aws_network.vpc_id
}

# VPC (AWS <=> GCP)
module "aws_vpn" {
  source = "./modules/aws/vpn"

  aws_asn = var.aws_asn
  gcp_asn = var.gcp_asn

  aws_vpc_id            = module.aws_network.vpc_id
  gcp_vpn_interface_ips = module.gcp_vpn.gcp_vpn_interface_ips
}


# GCP Network
module "gcp_network" {
  source = "./modules/gcp/network"

  cidr_block = cidrsubnet(var.cidr_block, 1, 1)
  vpc_name   = var.vpc_name
  region     = var.gcp_region
}

# GCP Virtual Machine
module "gcp_vm" {
  source = "./modules/gcp/vm"

  cidr_block = var.cidr_block
  vpc_name   = var.vpc_name
  region     = var.gcp_region

  public_subnet_id = module.gcp_network.public_subnet_id
  
  depends_on = [ module.gcp_network ]
}

# VPC (GCP <=> AWS)
module "gcp_vpn" {
  source = "./modules/gcp/vpn"

  gcp_asn    = var.gcp_asn
  aws_asn    = var.aws_asn
  gcp_region = var.gcp_region

  gcp_vpc_self_link   = module.gcp_network.vpc_self_link
  aws_vpn_connections = module.aws_vpn.aws_vpn_connections
}
