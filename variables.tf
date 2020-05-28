
terraform {
  backend "consul" {
    address  = "127.0.0.1:8500"
    scheme   = "http"
    path     = "tf/terraform.tfstate"
    lock     = true
    gzip     = false
  }
}

# Configure the Consul provider
provider "consul" {
  address    = "127.0.0.1:8500"
  datacenter = "dc1"
} 

data "consul_keys" "app" {

  key {
    name    = "rg_name"
    path    = "variables/rg"
  }
  key {
    name    = "as_name"
    path    = "variables/as-name"
  }
  

} 