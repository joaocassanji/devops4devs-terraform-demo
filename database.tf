module "database" {
  source = "./modules/mysql-server"
  location = var.location
  resource_group_name = module.rg.name
  db_server_name = "${var.environment}-${var.database.server_name}"
  db_name = var.database.database_name
  subnet_id = module.vnet.subnets.database
}