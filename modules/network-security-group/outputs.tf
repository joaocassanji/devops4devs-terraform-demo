output "name" {
  description = "The name of the resoruce created."
  value       = azurerm_network_security_group.nsg.name
}

output "id" {
  description = "The id of the resource created."
  value       = azurerm_network_security_group.nsg.id
}
