output "nic_id" {
  description = "A list with all the IDs of the NICs created."
  value = [for id in azurerm_network_interface.nic.*.id : "${id}"]
}