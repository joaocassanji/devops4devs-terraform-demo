output "name" {
  description = "The name of the created resource group."
  value       = azurerm_virtual_network.vnet.name
}

output "id" {
  description = "The id of the resource created."
  value       = azurerm_virtual_network.vnet.id
}

output "subnets" {
  description = "Map of objects containing the subnets and their ids."
  value = {for snet in azurerm_subnet.snet : snet.name => snet.id}
}