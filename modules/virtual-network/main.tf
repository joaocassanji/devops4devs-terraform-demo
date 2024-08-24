resource "azurerm_virtual_network" "vnet" {
  name     = "${var.naming_prefix}-vnet"
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = [var.address_space]
}

resource "azurerm_subnet" "snet" {
  count = length(var.subnets)
  name                                          = var.subnets[count.index].name
  resource_group_name                           = var.resource_group_name
  virtual_network_name                          = azurerm_virtual_network.vnet.name
  address_prefixes                              = [var.subnets[count.index].cidr]
}