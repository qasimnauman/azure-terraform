resource "azurerm_virtual_network" "zpayd-online" {
  name                = "${var.cluster_name}-network"
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = ["10.1.0.0/16"]
}

resource "azurerm_subnet" "default" {
  name                 = "default"
  virtual_network_name = azurerm_virtual_network.zpayd-online.name
  resource_group_name  = var.resource_group_name
  address_prefixes     = ["10.1.0.0/22"]
}