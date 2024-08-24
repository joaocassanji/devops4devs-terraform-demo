# Azure Load Balancer with Network Interface Configuration

This Terraform configuration sets up an Azure Load Balancer with a public IP, backend address pool, load balancer rules, and outbound rules. It also associates network interfaces with the backend address pool to ensure traffic is properly distributed across your resources.

## Resource Definitions

### 1. azurerm_public_ip (Public IP Address)

The `azurerm_public_ip` resource allocates a static public IP address for the Load Balancer.

- **name:** Name of the public IP resource.
- **location:** The Azure region where the IP will be created.
- **resource_group_name:** The resource group in which the IP will be created.
- **allocation_method:** Specifies that the IP address is static.
- **sku:** Defines the SKU as "Standard".

### 2. azurerm_lb (Load Balancer)

The `azurerm_lb` resource creates an Azure Load Balancer and configures its frontend IP.

- **name:** Name of the Load Balancer.
- **location:** The Azure region where the Load Balancer will be created.
- **resource_group_name:** The resource group in which the Load Balancer will be created.
- **sku:** Defines the SKU as "Standard".
- **frontend_ip_configuration:** Associates the Load Balancer with the public IP address.

### 3. azurerm_lb_backend_address_pool (Backend Address Pool)

The `azurerm_lb_backend_address_pool` resource creates a backend address pool for the Load Balancer.

- **loadbalancer_id:** References the Load Balancer to which this backend pool belongs.
- **name:** Name of the backend address pool.

### 4. azurerm_network_interface_backend_address_pool_association (NIC Backend Pool Association)

The `azurerm_network_interface_backend_address_pool_association` resource associates network interfaces with the Load Balancer's backend address pool.

- **count:** The number of network interface associations to create, based on the variable `var.backend_nics_count`.
- **network_interface_id:** The ID of the network interface to associate.
- **ip_configuration_name:** The name of the IP configuration in the NIC.
- **backend_address_pool_id:** The ID of the backend address pool.

### 5. azurerm_lb_probe (Load Balancer Probe)

The `azurerm_lb_probe` resource configures a health probe for the Load Balancer.

- **loadbalancer_id:** References the Load Balancer to which the probe belongs.
- **name:** Name of the probe.
- **port:** The port used for the probe.

### 6. azurerm_lb_rule (Load Balancer Rule)

The `azurerm_lb_rule` resource defines a rule for the Load Balancer to distribute traffic.

- **loadbalancer_id:** References the Load Balancer to which the rule belongs.
- **name:** Name of the rule.
- **protocol:** The protocol used for the rule (e.g., Tcp).
- **frontend_port/backend_port:** Specifies the ports for frontend and backend traffic.
- **disable_outbound_snat:** Disables outbound source network address translation (SNAT).
- **frontend_ip_configuration_name:** The name of the frontend IP configuration.
- **probe_id:** The ID of the health probe.
- **backend_address_pool_ids:** The IDs of the backend address pools.

### 7. azurerm_lb_outbound_rule (Load Balancer Outbound Rule)

The `azurerm_lb_outbound_rule` resource defines an outbound rule for the Load Balancer.

- **name:** Name of the outbound rule.
- **loadbalancer_id:** References the Load Balancer to which the rule belongs.
- **protocol:** Specifies the protocol for the outbound rule (e.g., All).
- **backend_address_pool_id:** The ID of the backend address pool.
- **frontend_ip_configuration:** Specifies the frontend IP configuration.

## Usage

To use this Terraform module, include it in your Terraform configuration and provide the required variables:

Replace `"./path_to_module"` with the path to the module and adjust the variables as needed for your environment.

This will create the Azure Load Balancer with the specified configuration and network interface associations.
