###########################################
#### Transit Gateway
###########################################
resource "aws_ec2_transit_gateway" "transit_gateway" {
  description                     = var.transit_gateway_description
  amazon_side_asn                 = var.amazon_side_asn
  default_route_table_association = var.default_route_table_association
  default_route_table_propagation = var.default_route_table_propagation
  auto_accept_shared_attachments  = var.auto_accept_shared_attachments
  vpn_ecmp_support                = var.vpn_ecmp_support
  dns_support                     = var.dns_support
  tags = merge(
    {
      Name = var.transit_gateway_name
    },
    var.common_tags
  )
}

###########################################
#### RAM
###########################################
resource "aws_ram_resource_share" "transit_gateway_share" {
  name                      = var.resource_share_name
  allow_external_principals = var.allow_external_principals
  tags = merge(
    {
      Name = var.resource_share_name
    },
    var.common_tags
  )
}

# Associate TGW with RAM in Shared Services Account (devops)
resource "aws_ram_principal_association" "ram_principal" {
  count              = length(var.account_numbers)
  principal          = var.account_numbers[count.index]
  resource_share_arn = aws_ram_resource_share.transit_gateway_share.id
  depends_on         = [aws_ram_resource_share.transit_gateway_share]
}

# Associate Resource with RAM in Shared Services Account (devops)
resource "aws_ram_resource_association" "ram_association" {
  resource_arn       = aws_ec2_transit_gateway.transit_gateway.arn
  resource_share_arn = aws_ram_resource_share.transit_gateway_share.id
  depends_on = [
    aws_ram_resource_share.transit_gateway_share,
    aws_ec2_transit_gateway.transit_gateway
  ]
}

###########################################
#### VPN
###########################################
resource "aws_customer_gateway" "cgw" {
  bgp_asn    = 65000
  ip_address = var.customer_gateway_ip
  type       = var.customer_gateway_type
  tags = merge(

    {
      Name = var.aws_customer_gateway_name
    },
    var.common_tags
  )
  depends_on = [aws_ec2_transit_gateway.transit_gateway]

}

resource "aws_vpn_connection" "vpn_connection" {
  transit_gateway_id  = aws_ec2_transit_gateway.transit_gateway.id
  customer_gateway_id = aws_customer_gateway.cgw.id
  type                = var.vpn_connection_type
  static_routes_only  = var.static_routes_only
  tunnel1_log_options {
    cloudwatch_log_options {
      log_enabled       = var.log_enabled
      log_group_arn     = aws_cloudwatch_log_group.vpn.arn
      log_output_format = var.log_output_format
    }
  }
  tunnel2_log_options {
    cloudwatch_log_options {
      log_enabled       = var.log_enabled
      log_group_arn     = aws_cloudwatch_log_group.vpn.arn
      log_output_format = var.log_output_format
    }
  }
  tags = merge(
    {
      Name = var.aws_vpn_connection_name
    },
    var.common_tags
  )
  depends_on = [
    aws_ec2_transit_gateway.transit_gateway,
    aws_customer_gateway.cgw,
    aws_cloudwatch_log_group.vpn
  ]
}

resource "aws_cloudwatch_log_group" "vpn" {
  name              = var.aws_cloudwatch_log_group_name
  retention_in_days = var.log_retention_in_days
  tags              = var.common_tags
}

###########################################
#### Add routes here!!
###########################################
resource "aws_ec2_transit_gateway_route" "on_prem_routes" {
  count                          = length(var.on_prem_destination_cidr_blocks)
  destination_cidr_block         = var.on_prem_destination_cidr_blocks[count.index]
  transit_gateway_route_table_id = aws_ec2_transit_gateway.transit_gateway.association_default_route_table_id
  transit_gateway_attachment_id  = aws_vpn_connection.vpn_connection.transit_gateway_attachment_id
  blackhole                      = false
}