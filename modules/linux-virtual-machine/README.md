
# Azure Virtual Machine with Network Interface and NGINX Extension

This Terraform configuration creates a set of resources in Azure, specifically a Network Interface, a Linux Virtual Machine, and a Virtual Machine Extension for installing and configuring NGINX. Below is an explanation of each resource and how they work together.

## Resource Definitions

### 1. azurerm_network_interface (NIC)

The `azurerm_network_interface` resource creates a network interface in Azure.

- **count:** The number of network interfaces to create, based on the variable `var.instances`.
- **name:** Each NIC is named using the pattern `${var.name}-nic-${count.index}`.
- **location:** The Azure region where the NIC will be created.
- **resource_group_name:** The resource group in which the NIC will be created.
- **ip_configuration:** Configures the IP settings, including subnet association and dynamic IP allocation.

### 2. azurerm_linux_virtual_machine (Linux VM)

The `azurerm_linux_virtual_machine` resource creates a Linux virtual machine in Azure.

- **count:** The number of virtual machines to create, based on the variable `var.instances`.
- **name:** Each VM is named using the pattern `${var.name}-vm-${count.index}`.
- **resource_group_name:** The resource group in which the VM will be created.
- **location:** The Azure region where the VM will be created.
- **size:** Specifies the size of the VM (e.g., Standard_B2s).
- **admin_username/admin_password:** Specifies the administrator username and password.
- **network_interface_ids:** Associates the VM with a network interface created earlier.
- **os_disk:** Configures the OS disk, including caching and storage account type.
- **source_image_reference:** Specifies the image to use for the VM, including publisher, offer, SKU, and version.

### 3. azurerm_virtual_machine_extension (VM Extension)

The `azurerm_virtual_machine_extension` resource installs and configures NGINX on the Linux virtual machine.

- **count:** The number of VM extensions to create, based on the variable `var.instances`.
- **name:** The name of the extension, in this case, `Nginx`.
- **virtual_machine_id:** The ID of the VM to which this extension will be applied.
- **publisher/type/type_handler_version:** Specifies the extension publisher, type, and version.
- **settings:** A JSON block containing the commands to execute on the VM. This installs NGINX, creates a simple "Hello World" page, and restarts NGINX.

## Usage

To use this Terraform module, you can call it from your main Terraform configuration as follows:

Replace `"./path_to_module"` with the path where this module is located. Adjust the variables as needed for your environment.

This will create the specified number of Linux VMs with attached network interfaces and NGINX installed.
