variable "name" {
  description = "Specifies the name of the resource."
  type        = string
}

variable "location" {
  description = "Specifies the Azure region where the resource will be deployed."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which the resource will be created."
  type        = string
}

variable "virtual_network_id" {
  description = "The ID of the virtual network (VNet) to which the Load Balancer will be attached."
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet to which the Load Balancer will be attached."
  type        = string
}

variable "backend_nics_count" {
  description = "Specifies the number of NICs to be associated with the backend pool."
  type        = number
}

variable "backend_nics" {
  description = "A list of NIC IDs to be associated with the backend pool."
  type        = list(string)
}
