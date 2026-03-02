component "resource_group" {
  source  = "terraform-ibm-modules/resource-group/ibm"
  version = "1.4.8"
  inputs = {
    resource_group_name = "${var.prefix}-rg"
  }

  providers = {
    ibm = provider.ibm.this
  }
}

component "vpc" {
  source  = "terraform-ibm-modules/landing-zone-vpc/ibm"
  version = "8.15.3"

  inputs = {
    resource_group_id = component.resource_group.resource_group_id
    region            = var.region
    name              = "vpc"
    prefix            = var.prefix
    tags              = var.resource_tags
    subnets = {
      zone-1 = [
        {
          name           = "subnet-a"
          cidr           = "10.10.10.0/24"
          public_gateway = true
          acl_name       = "vpc-acl"
        }
      ],
      zone-2 = [
        {
          name           = "subnet-b"
          cidr           = "10.10.20.0/24"
          public_gateway = true
          acl_name       = "vpc-acl"
        }
      ],
      zone-3 = [
        {
          name           = "subnet-c"
          cidr           = "10.10.30.0/24"
          public_gateway = true
          acl_name       = "vpc-acl"
        }
      ]
    }
    security_group_rules = [{
      name       = "allow-all-inbound-sg"
      direction  = "inbound"
      remote     = "0.0.0.0/0"
      local      = "0.0.0.0/0"
      ip_version = "ipv4"
    }]
  }

  providers = {
    ibm       = provider.ibm.this
    time      = provider.time.this
    # terraform = provider.terraform.this
  }
}


component "base_ocp" {
  source  = "terraform-ibm-modules/base-ocp-vpc/ibm"
  version = "3.81.7"

  inputs = {
    cluster_name      = "${var.prefix}-ocp-cluster"
    resource_group_id = component.resource_group.resource_group_id
    region            = var.region
    vpc_id            = component.vpc.vpc_id
    vpc_subnets       = component.vpc.subnet_zone_list
    worker_pools = [
      {
        subnet_prefix    = "zone-1"
        pool_name        = "default"
        machine_type     = "bx2.4x16"
        workers_per_zone = 2
        operating_system = "RHCOS"
      }
    ]
    force_delete_storage = true
  }

  providers = {
    ibm        = provider.ibm.this
    time       = provider.time.this
    external   = provider.external.this
    kubernetes = provider.kubernetes.this
    null       = provider.null.this
    random     = provider.random.this
    # terraform  = provider.terraform.this
  }
}

