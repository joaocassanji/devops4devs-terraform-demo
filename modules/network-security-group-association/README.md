# Azure Network Security Group Association with Subnets

This Terraform module sets up associations between a Network Security Group (NSG) and multiple subnets. This association ensures that the network security rules defined in the NSG are applied to the specified subnets.

## Resource Definitions

### 1. Subnet Network Security Group Association

The `azurerm_subnet_network_security_group_association` resource is used to associate a Network Security Group with one or more subnets.

- **count:** Defines the number of associations to create based on the number of subnet IDs provided.
- **subnet_id:** The ID of the subnet to be associated with the NSG.
- **network_security_group_id:** The ID of the Network Security Group to be associated with the subnet.

## Usage

To use this Terraform module, include it in your Terraform configuration and provide the necessary variables:

- **subnets_id:** A list of subnet IDs that you want to associate with the NSG.
- **network_security_group_id:** The ID of the Network Security Group that will be associated with the subnets.

This configuration will create associations between the specified Network Security Group and the provided subnets, ensuring that the NSG's rules are enforced on traffic within those subnets.
