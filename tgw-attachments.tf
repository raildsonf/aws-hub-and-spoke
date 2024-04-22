resource "aws_ec2_transit_gateway_vpc_attachment" "vpc1" {
  appliance_mode_support = "disable"
  dns_support            = "enable"
  ipv6_support           = "disable"
  subnet_ids             = ["subnet-idididididi"]
  tags = {
    Name = "tgw-attach-1"
  }
  tags_all = {
    Name = "tgw-attach-1"
  }
  transit_gateway_default_route_table_association = true
  transit_gateway_default_route_table_propagation = true
  transit_gateway_id                              = aws_ec2_transit_gateway.this.id
  vpc_id                                          = "vpc-idididididi"
}

resource "aws_ec2_transit_gateway_vpc_attachment" "vpc2" {
  appliance_mode_support = "disable"
  dns_support            = "enable"
  ipv6_support           = "disable"
  subnet_ids             = ["subnet-ididididiidi"]
  tags = {
    Name = "tgw-attach-2"
  }
  tags_all = {
    Name = "tgw-attach-2"
  }
  transit_gateway_default_route_table_association = true
  transit_gateway_default_route_table_propagation = true
  transit_gateway_id                              = aws_ec2_transit_gateway.this.id
  vpc_id                                          = "vpc-idididididi"
}
