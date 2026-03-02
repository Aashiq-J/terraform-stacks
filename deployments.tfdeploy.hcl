
store "varset" "ibm_credentials" {
  id       = "varset-7X1yJ4nwvovXU9MD"
  category = "terraform"
}

deployment "us-east" {
  inputs = {
    prefix           = "ausyd"
    region           = "au-syd"
    resource_tags    = ["au-syd"]
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
