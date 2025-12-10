
deployment "us-east" {
  inputs = {
    prefix        = "east"
    region        = "us-east"
    resource_tags = ["us-east"]
  }
}
deployment "ca-tor" {
  inputs = {
    prefix        = "tor"
    region        = "ca-tor"
    resource_tags = ["ca-tor"]
  }
}
