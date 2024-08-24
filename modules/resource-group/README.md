# Azure Resource Group Configuration

This Terraform module sets up an Azure Resource Group, which serves as a container for managing Azure resources.

## Resource Definitions

### 1. Resource Group

The `azurerm_resource_group` resource creates an Azure Resource Group.

- **name:** Specifies the name of the resource group. It is constructed using a naming prefix provided as a variable.
- **location:** The Azure region where the resource group will be created.

## Usage

To use this Terraform module, include it in your Terraform configuration and provide the necessary variables:

- **naming_prefix:** A prefix that is used to construct the name of the resource group.
- **location:** The Azure region where the resource group will be created.

This configuration will create a resource group with the specified name and location, serving as a logical container for other Azure resources.
