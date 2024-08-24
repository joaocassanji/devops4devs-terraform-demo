resource "azurerm_resource_group" "rg" {
  name     = "${var.naming_prefix}-rg"
  location = var.location
}
