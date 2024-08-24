# Azure Network Security Group Configuration

This Terraform module sets up an Azure Network Security Group (NSG) with a set of security rules to control inbound and outbound traffic within a virtual network. The NSG is configured to allow specific types of traffic based on the defined rules.

## Resource Definitions

### 1. Network Security Group (NSG)

The `azurerm_network_security_group` resource creates a Network Security Group in Azure, which is used to enforce security rules on network traffic.

- **name:** Specifies the name of the NSG.
- **location:** The Azure region where the NSG will be created.
- **resource_group_name:** The resource group in which the NSG will be created.

### Security Rules

#### Internal Inbound Rule

- **name:** Identifies the rule for internal inbound traffic.
- **priority:** The priority of the rule, which determines the order in which rules are applied.
- **direction:** Indicates that the rule applies to inbound traffic.
- **access:** Allows the traffic.
- **protocol:** Applies to all protocols.
- **source_port_range:** Applies to all source ports.
- **destination_port_range:** Applies to all destination ports.
- **source_address_prefix:** The address range from which traffic is allowed (typically the virtual network address space).
- **destination_address_prefix:** The address range to which traffic is allowed (typically the virtual network address space).

#### Internal Outbound Rule

- **name:** Identifies the rule for internal outbound traffic.
- **priority:** The priority of the rule.
- **direction:** Indicates that the rule applies to outbound traffic.
- **access:** Allows the traffic.
- **protocol:** Applies to all protocols.
- **source_port_range:** Applies to all source ports.
- **destination_port_range:** Applies to all destination ports.
- **source_address_prefix:** The address range from which traffic is allowed (typically the virtual network address space).
- **destination_address_prefix:** The address range to which traffic is allowed (typically the virtual network address space).

#### Web Rule

- **name:** Identifies the rule for web traffic.
- **priority:** The priority of the rule.
- **direction:** Indicates that the rule applies to inbound traffic.
- **access:** Allows the traffic.
- **protocol:** Applies to TCP protocol.
- **source_port_range:** Applies to all source ports.
- **destination_port_range:** Specifies port 80 (commonly used for HTTP).
- **source_address_prefix:** Allows traffic from any source address.
- **destination_address_prefix:** Specifies the address range for the web subnet.

## Usage

To use this Terraform module, include it in your Terraform configuration and provide the necessary variables such as the name, location, and address spaces.

This configuration will create a Network Security Group with rules to allow internal traffic within the virtual network and web traffic on port 80.
