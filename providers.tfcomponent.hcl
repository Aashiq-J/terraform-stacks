

required_providers {
  # Ensure that there is always 1 example locked into the lowest provider version of the range defined in the main
  # module's version.tf (basic), and 1 example that will always use the latest provider version.
  ibm = {
    source  = "ibm-cloud/ibm"
    version = ">= 1.86.0"
  }
  null = {
    source  = "hashicorp/null"
    version = ">= 3.2.1, < 4.0.0"
  }
  kubernetes = {
    source  = "hashicorp/kubernetes"
    version = ">= 3.0.0, < 4.0.0"
  }
  time = {
    source  = "hashicorp/time"
    version = ">= 0.9.1, < 1.0.0"
  }
  external = {
    source  = "hashicorp/external"
    version = ">=2.3.5, <3.0.0"
  }
  random = {
    source  = "hashicorp/random"
    version = ">= 3.5.1, < 4.0.0"
  }

  # terraform = {
  #   source  = "hashicorp/terraform"
  #   version = ">= 1.14.6"
  # }
  terraform = {
    source = "terraform.io/builtin/terraform"
    # Optionally add version constraint
  }
}

provider "ibm" "this" {
  config {
    ibmcloud_api_key = var.ibmcloud_api_key
    region           = var.region
  }
}

provider "time" "this" {
  config {
  }
}

provider "null" "this" {
  config {
  }
}

provider "kubernetes" "this" {
  config {
  }
}

provider "external" "this" {
  config {
  }
}

provider "random" "this" {
  config {
  }
}

provider "terraform" "this" {
  config {
  }
}