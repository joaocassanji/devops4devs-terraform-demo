variable "location" {
  description = "Location of the resources"
  type        = string
}

variable "naming_prefix" {
  description = "Prefix to be used in the naming of the resources."
  type        = string
}

variable "environment" {
  description = "Environment to be used in the naming of the resources"
  type = string
}

variable "virtual_network" {
  description = "Object containing the virtual network and subnets properties."
  type = object({
    address_space = string
    subnets = list(object({
      name = string
      cidr = string
      endpoint_type = optional(string, null)
    }))
  })
}

variable "virtual_machine" {
  description = "Object containing the virtual machine properties."
  type = list(object({
    name = string
    instances = number
    subnet_name = string
    size = string
  }))
}

variable "vm_username" {
  description = "Username to access the VMs, loaded by environment variables."
  sensitive = true
}

variable "vm_password" {
  description = "Password to access the VMs, loaded by environment variables."
  sensitive = true
}

variable "database" {
  description = "Object containing the database server properties."
  type = object({
    server_name = string
    database_name = string
  })
}