variable "name" {
  description = "Defines the name of the Linux Virtual Machine. Changing this value will result in the creation of a new resource."
  type        = string
}

variable "location" {
  description = "Specifies the Azure region where the resource will be deployed. Changing this value will result in the creation of a new resource."
  type        = string
}

variable "instances" {
  description = "Specifies the number of VM instances to be created."
  type        = number
  default     = 1
}

variable "resource_group_name" {
  description = "The name of the resource group where the Linux Virtual Machine will be created."
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet to which the NIC will be attached."
  type        = string
}

variable "size" {
  description = "Specifies the size (SKU) of the Virtual Machine."
  type        = string
  default     = "Standard_B1s"
}

variable "credentials" {
  description = "Object containing the credentials to be used to access the virtual machine."
  type        = object({
    username = string
    password = string
  })
  sensitive = true
}

variable "os_disk" {
  description = "Specifies the configuration of the OS disk, including caching and storage account type."
  type = object({
    caching              = string
    storage_account_type = string
  })
  default = {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
}

variable "image" {
  description = "Defines the image settings for the VM, including publisher, offer, SKU, and version."
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
  default = {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }
}
