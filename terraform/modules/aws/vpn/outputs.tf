
locals {
  tunnels = flatten([
    for k, v in aws_vpn_connection.aws_to_gcp_vpn : [
      {
        # tunnel1
        tunnel = {
          address            = v.tunnel1_address
          cgw_inside_address = v.tunnel1_cgw_inside_address
          vgw_inside_address = v.tunnel1_vgw_inside_address
          preshared_key      = v.tunnel1_preshared_key
        }
      },
      {
        # tunnel2
        tunnel = {
          address            = v.tunnel2_address
          cgw_inside_address = v.tunnel2_cgw_inside_address
          vgw_inside_address = v.tunnel2_vgw_inside_address
          preshared_key      = v.tunnel2_preshared_key
        }
      }
    ]
  ])

  aws_vpn_connections = {
    for i, t in local.tunnels : i => {
      tunnel_address                  = t.tunnel.address
      peer_external_gateway_interface = i
      vpn_gateway_interface           = floor(i / 2)
      preshared_key                   = t.tunnel.preshared_key
      vgw_inside_address              = t.tunnel.vgw_inside_address
      cgw_inside_address              = t.tunnel.cgw_inside_address
    }
  }
}

output "aws_vpn_connections" {
  description = "List of AWS VPN Connections"
  value       = local.aws_vpn_connections
}

output "vgw_id" {
  description = "Virtual Gateway ID"
  value = aws_vpn_gateway.aws_vpn_gateway.id
}
