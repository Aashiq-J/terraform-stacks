
store "varset" "ibm_credentials" {
  id       = "varset-7X1yJ4nwvovXU9MD"
  category = "terraform"
}

deployment "us-east" {
  inputs = {
    prefix           = "east1"
    region           = "us-east"
    resource_tags    = ["us-east"]
    ibmcloud_api_key = store.varset.ibm_credentials.ibmcloud_api_key
  }
}

deployment "ca-tor" {
  inputs = {
    prefix           = "tor1"
    region           = "ca-tor"
    resource_tags    = ["ca-tor"]
    ibmcloud_api_key = store.varset.ibm_credentials.ibmcloud_api_key
  }
}

publish_output "resource_group_name" {
  description = "The networking Stack's VPC's ID."
  value       = deployment.us-east.resource_group_name
}
