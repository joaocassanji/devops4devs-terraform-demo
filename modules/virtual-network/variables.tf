variable "naming_prefix" {
  description = "A prefix used to generate resource names. This ensures consistency and helps in identifying related resources."
  type = string
}

variable "location" {
  description = "The Azure region where the resource will be deployed. This determines the geographic location of the resource."
  type = string
}

variable "resource_group_name" {
  description = "The name of the Azure Resource Group where the resource will be created. This groups related resources together for management purposes."
  type = string
}

variable "address_space" {
  description = "The IP address range allocated for the Virtual Network. This defines the network's address range and subnetting capabilities."
  type = string
}

variable "subnets" {
  description = "A list of objects defining the properties for each subnet within the Virtual Network. Each object includes the subnet's name, CIDR block, and endpoint type."
  type = list(object({
    name           = string
    cidr           = string
    endpoint_type  = string
  }))
}
