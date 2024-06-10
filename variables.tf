variable "role_arn" {
  type        = string
  description = "IAM Role for terraform cicd"
}
variable "region" {
  type    = string
  default = "sa-east-1"
}

#RAM
variable "resource_share_name" {
  type        = string
  description = "resource_share_name"
}

variable "account_numbers" {
  type        = list(string)
  description = "List of AWS account numbers"
}
variable "allow_external_principals" {
  type        = bool
  description = "value"
}


#TGW
variable "transit_gateway_name" {
  type        = string
  description = "transit_gateway_name"
}
variable "transit_gateway_description" {
  type        = string
  description = "transit_gateway_description"
}
variable "amazon_side_asn" {
  type        = string
  description = "The private Autonomous System Number (ASN) for the Amazon side of a BGP session."
}

variable "default_route_table_association" {
  type        = string
  description = "Specify whether resource attachment creates a default association."
}

variable "default_route_table_propagation" {
  type        = string
  description = "Specify whether resource attachment propagates a default route."
}

variable "auto_accept_shared_attachments" {
  type        = string
  description = "Specify whether resource attachment automatically accepts ownership of a resource sharing request."
}

variable "vpn_ecmp_support" {
  type        = string
  description = "Specify whether Amazon VPC supports equal-cost multi-path routing."
}

variable "dns_support" {
  type        = string
  description = "Specify whether the DNS resolution is supported."
  default     = true
}

#VPN
variable "vpn_connection_type" {
  type        = string
  description = "value"
}
variable "static_routes_only" {
  type        = bool
  description = "value"
}
variable "aws_customer_gateway_name" {
  type        = string
  description = "value"
}
variable "aws_vpn_connection_name" {
  type        = string
  description = "value"
}

variable "on_prem_destination_cidr_blocks" {
  type        = list(string)
  description = "List of on-premise destination CIDR blocks"
}

variable "customer_gateway_ip" {
  type        = string
  description = "value"
}
variable "customer_gateway_type" {
  type        = string
  description = "value"
}

# Tags comuns para recursos
variable "common_tags" {
  type        = map(string)
  description = "Common tags for resources"
}

variable "aws_cloudwatch_log_group_name" {
  type = string
}

variable "log_enabled" {
  type = bool
}

variable "log_retention_in_days" {
  type = number
}

variable "log_output_format" {
  type    = string
  default = "json"
}