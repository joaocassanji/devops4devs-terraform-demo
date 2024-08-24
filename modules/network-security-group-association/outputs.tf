output "id" {
  description = "The ID of the Association."
  value       = azurerm_subnet_network_security_group_association.nsg_assoc[*].id
}
