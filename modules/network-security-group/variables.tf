variable "name" {
  description = "The name of the Network Security Group (NSG). This name is used to identify the NSG within Azure and should be unique within the resource group."
  type = string
}

variable "resource_group_name" {
  description = "The name of the Azure Resource Group where the NSG will be created. This groups related resources together for management purposes."
  type = string
}

variable "location" {
  description = "The Azure region where the Network Security Group will be deployed. This specifies the geographic location of the NSG."
  type = string
}

variable "vnet_address_space" {
  description = "The IP address range of the Virtual Network (VNet). This is used to define the network boundaries and allow traffic within the VNet."
  type = string
}

variable "web_subnet_cidr" {
  description = "The CIDR block for the web subnet. This defines the IP address range used for the subnet within the Virtual Network."
  type = string
}
