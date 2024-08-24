resource "azurerm_subnet_network_security_group_association" "nsg_assoc" {
  count                     = length(var.subnets_id)
  subnet_id                 = var.subnets_id[count.index]
  network_security_group_id = var.network_security_group_id
}
