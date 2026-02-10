component "resource_group" {
  source  = "terraform-ibm-modules/resource-group/ibm"
  version = "2.0.1-rc"
  inputs = {
    resource_group_name = "${var.prefix}-resource-group"
  }

  providers = {
    ibm = provider.ibm.this
  }
}

output "resource_group_name" {
  description = "Resource group name"
  type        = string
  value       = component.resource_group.resource_group_name
}

# component "network" {
#   source  = "terraform-ibm-modules/landing-zone-vpc/ibm"
#   version = "latest"

#   inputs = {
#     resource_group_id = component.resource_group.resource_group_id
#     region            = var.region
#     name              = "vpc"
#     prefix            = var.prefix
#     tags              = var.resource_tags
#     subnets = {
#       zone-1 = [
#         {
#           name           = "subnet-a"
#           cidr           = "10.10.10.0/24"
#           public_gateway = true
#           acl_name       = "vpc-acl"
#         }
#       ]
#     }
#     security_group_rules = [{
#       name       = "allow-all-inbound-sg"
#       direction  = "inbound"
#       remote     = "0.0.0.0/0" # source of the traffic. 0.0.0.0/0 traffic from all across the internet.
#       local      = "0.0.0.0/0" # A CIDR block of 0.0.0.0/0 allows traffic to all local IP addresses (or from all local IP addresses, for outbound rules).
#       ip_version = "ipv4"
#     }]
#   }

#   providers = {
#     ibm = provider.ibm.this
#   }
# }

