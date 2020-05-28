
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



provider "azurerm" {
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
  version = "=2.0.0"
  subscription_id = "0c3e0b25-bcd1-4f79-9a3a-cc0c892d6bfa"
  tenant_id = "2c03f75f-06e4-46f7-86f5-d8d70bef1cf3"
  features {}
}


/* data "terraform_remote_state" "foo" {
  backend = "consul"
  config = {
    path = "test/"
  }
} */

 # Access a key in Consul
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

resource "azurerm_availability_set" "kube_as" {

  resource_group_name = "${data.consul_keys.app.var.rg_name}"
  location            = "westeurope"
  name =  "${data.consul_keys.app.var.as_name}"

}
 


/*# Use our variable from Consul
resource "aws_instance" "app" {
  ami = "${consul_keys.app.var.ami}"
}*/
