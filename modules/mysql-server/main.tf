
resource "azurerm_private_endpoint" "endpoint" {
  name                = "db-endpoint"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = "private-serviceconnection"
    private_connection_resource_id = azurerm_mssql_server.mysqlsv.id
    subresource_names              = ["sqlServer"]
    is_manual_connection           = false
  }

}

resource "azurerm_mssql_server" "mysqlsv" {
  name                = var.db_server_name
  location            = var.location
  resource_group_name = var.resource_group_name

  administrator_login          = "mysqladminun"
  administrator_login_password = "H@Sh1CoR3!"
  version                      = "12.0"
  minimum_tls_version          = "1.2"
}

resource "azurerm_mssql_database" "db" {
  name           = var.db_name
  server_id      = azurerm_mssql_server.mysqlsv.id
}