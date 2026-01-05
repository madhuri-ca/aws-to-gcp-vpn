
output "gcp_vpn_interface_ips" {
  value = [ for interface in google_compute_ha_vpn_gateway.gcp_vpn_gateway.vpn_interfaces :
  interface.ip_address
  ]
}