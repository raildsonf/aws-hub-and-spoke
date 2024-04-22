resource "aws_ec2_transit_gateway" "this" {
  amazon_side_asn                 = 64512
  auto_accept_shared_attachments  = "disable"
  default_route_table_association = "enable"
  default_route_table_propagation = "enable"
  description                     = null
  dns_support                     = "enable"
  multicast_support               = "disable"
  tags = {
    Name = "tgw-mte-prd"
  }
  tags_all = {
    Name = "tgw-mte-prd"
  }
  transit_gateway_cidr_blocks = []
  vpn_ecmp_support            = "enable"
}
