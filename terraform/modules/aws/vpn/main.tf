
# Customer Gateway (GCP HA VPN)
resource "aws_customer_gateway" "gcp_vpn_gateway" {
  count = 2

  bgp_asn    = var.gcp_asn
  ip_address = var.gcp_vpn_interface_ips[count.index]
  type       = "ipsec.1"
}

# VPN Gateway (AWS)
resource "aws_vpn_gateway" "aws_vpn_gateway" {
  vpc_id          = var.aws_vpc_id
  amazon_side_asn = var.aws_asn # 65001
}

# VPN Connection (AWS <=> GCP)
resource "aws_vpn_connection" "aws_to_gcp_vpn" {
  count = 2

  vpn_gateway_id      = aws_vpn_gateway.aws_vpn_gateway.id
  customer_gateway_id = aws_customer_gateway.gcp_vpn_gateway[count.index].id
  type                = "ipsec.1"
  static_routes_only  = false
}
