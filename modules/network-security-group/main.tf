resource "azurerm_network_security_group" "nsg" {
  name = var.name
  location = var.location
  resource_group_name = var.resource_group_name

  security_rule {
    name = "internal-inbound"
    priority = 1100
    direction = "Inbound"
    access = "Allow"
    protocol = "*"
    source_port_range = "*"
    destination_port_range = "*"
    source_address_prefix = var.vnet_address_space
    destination_address_prefix = var.vnet_address_space
  }

  security_rule {
    name = "internal-outbound"
    priority = 1101
    direction = "Outbound"
    access = "Allow"
    protocol = "*"
    source_port_range = "*"
    destination_port_range = "*"
    source_address_prefix = var.vnet_address_space
    destination_address_prefix = var.vnet_address_space
  }

  security_rule {
    name = "web"
    priority = 1200
    direction = "Inbound"
    access = "Allow"
    protocol = "Tcp"
    source_port_range = "*"
    destination_port_range = "80"
    source_address_prefix = "*"
    destination_address_prefix = var.web_subnet_cidr
  }

}