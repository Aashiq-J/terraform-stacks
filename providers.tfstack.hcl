
required_providers {
  # Ensure that there is always 1 example locked into the lowest provider version of the range defined in the main
  # module's version.tf (basic), and 1 example that will always use the latest provider version.
  ibm = {
    source  = "IBM-Cloud/ibm"
    version = ">=1.59.0"
  }
}



provider "ibm" "this" {
  config {
    ibmcloud_api_key = var.ibmcloud_api_key
    region           = var.region
  }
}
