
provider "azurerm" {
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
  version = "=2.0.0"
  subscription_id = "xxxxxxxxx"
  tenant_id = "xxxxxxx"
  features {}
}


#create as
resource "azurerm_availability_set" "kube_as" {

  resource_group_name = data.consul_keys.app.var.rg_name
  location            = "westeurope"
  name =  data.consul_keys.app.var.as_name

}
 
