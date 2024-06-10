region = "sa-east-1"

#RAM
resource_share_name       = "resource-share-devops"
account_numbers           = ["339712999853", "381491887702", "381491982215"]
allow_external_principals = true

#TGW
transit_gateway_name            = "shared-transit-gateway"
transit_gateway_description     = "MTE Transit Gateway for Hub-and-Spoke Network"
amazon_side_asn                 = "65514"
default_route_table_association = "enable"
default_route_table_propagation = "enable"
auto_accept_shared_attachments  = "enable"
vpn_ecmp_support                = "enable"
dns_support                     = "enable"

#VPN
aws_customer_gateway_name      = "shared-customer-gateway"
aws_vpn_connection_name        = "shared-vpn-connection"
on_prem_destination_cidr_block = "10.252.0.0/16"
static_routes_only             = false
vpn_connection_type            = "ipsec.1"
customer_gateway_ip            = "189.9.32.2"
customer_gateway_type          = "ipsec.1"

#Logs
log_enabled           = true
log_retention_in_days = 30

######################################
## Common TAGS
######################################
common_tags = {
  Project       = "Hub-and-spoke"
  Team          = "Torre Linux"
  Component_url = "https://git.mte.gov.br/cloud/projects/devops/network/hub-and-spoke.git"
  Stack         = "Networking"
  Env           = "Devops"
}
