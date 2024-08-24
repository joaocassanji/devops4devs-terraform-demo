variable "db_server_name" {
  description = "The name of the database server. This name is used to identify the server within Azure and should be unique within the resource group."
  type = string
}

variable "location" {
  description = "The Azure region where the resources, including the database server and database, will be deployed. This specifies the geographic location of the resources."
  type = string
}

variable "resource_group_name" {
  description = "The name of the Azure Resource Group where the database server and database will be created. This groups related resources together for easier management."
  type = string
}

variable "db_name" {
  description = "The name of the database to be created on the database server. This name is used to identify the database within the server."
  type = string
}

variable "subnet_id" {
  description = "The ID of the subnet to which the database server will be connected. This allows the database server to communicate securely within the specified subnet."
  type = string
}
