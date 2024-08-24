# Azure Virtual Network and Subnets Configuration

This Terraform module creates an Azure Virtual Network (VNet) and associates it with one or more subnets. The VNet serves as the foundational network for other resources, and the subnets segment the network into distinct address spaces.

## Resource Definitions

### 1. Virtual Network (VNet)

The `azurerm_virtual_network` resource sets up an Azure Virtual Network.

- **name:** Specifies the name of the VNet. It is constructed using a naming prefix provided as a variable.
- **location:** The Azure region where the VNet will be created.
- **resource_group_name:** The resource group in which the VNet will be created.
- **address_space:** Defines the address space for the VNet. It is provided as a variable.

### 2. Subnets

The `azurerm_subnet` resource creates subnets within the specified Virtual Network.

- **count:** Determines the number of subnets to create based on the number of entries in the `subnets` variable.
- **name:** The name of each subnet. It is defined in the `subnets` variable.
- **resource_group_name:** The resource group where the subnets will be created.
- **virtual_network_name:** The name of the VNet where the subnets will be created.
- **address_prefixes:** Defines the CIDR block for each subnet, as specified in the `subnets` variable.

## Usage

To use this Terraform module, include it in your Terraform configuration and provide the necessary variables:

- **naming_prefix:** A prefix used to construct the name of the Virtual Network.
- **location:** The Azure region where the VNet and subnets will be created.
- **resource_group_name:** The resource group in which the VNet and subnets will be created.
- **address_space:** The address space for the VNet.
- **subnets:** A list of subnet configurations, each including a name and CIDR block.

This configuration will create a Virtual Network with the specified address space and one or more subnets, allowing for network segmentation within your Azure environment.
