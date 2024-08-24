# Terraform Project Overview

## Architecture

![Architecture Diagram](./architecture-diagram.jpg)

## Description

This Terraform project provisions a comprehensive Azure infrastructure, including:

1. **Resource Group**: Creates an Azure Resource Group to logically organize and manage related Azure resources.

2. **Virtual Network (VNet)**: Configures a Virtual Network with a defined address space and subnets. The VNet provides network isolation and segmentation for the resources.

3. **Linux Virtual Machines (VMs)**: Deploys Linux VMs within the specified subnets of the VNet. Parameters such as the number of instances and VM configurations are customizable.

4. **Network Security Group (NSG)**: Sets up an NSG to manage inbound and outbound network traffic rules for resources within the VNet. It enforces security policies based on traffic rules.

5. **NSG Association**: Associates the NSG with the relevant subnets in the VNet to apply the defined security rules.

6. **Load Balancer**: Configures a load balancer to distribute incoming traffic across multiple VMs, ensuring high availability and reliability of web services.

7. **Database Server**: Sets up a MySQL database server and a specified database within the VNet. This ensures secure communication and integration with other network resources.

## How to Use This Project

To deploy this Terraform project, follow these steps:

1. **Login to Azure CLI**: Authenticate to your Azure account using the Azure CLI:
    ```bash
    az login
    ```

2. **Initialize Terraform**: Prepare your working directory for other commands.
    ```bash
    terraform init --backend-config="/config/backend/prod/demo.backend.conf"
    ```

3. **Review the Deployment Plan**: Generate an execution plan to see what changes Terraform will make.
    ```bash
    terraform plan --var-file="./config/variables/prod/variables.tfvars"
    ```

4. **Apply the Configuration**: Apply the changes required to reach the desired state of the configuration.
    ```bash
    terraform apply --var-file="./config/variables/prod/variables.tfvars"
    ```


## Parameter Configuration

In this project, several parameters are defined as variables to be configured. These include:

- **`location`**: Specifies the Azure region where the resources will be deployed.

- **`naming_prefix`**: A prefix used in the naming of the resources for consistency and organization.

- **`virtual_network`**: An object that defines the properties of the Virtual Network, including the address space and subnets. The subnets are specified with names, CIDR blocks, and optional endpoint types.

- **`virtual_machine`**: A list of objects defining the properties of the Virtual Machines. Each object includes the VM name, number of instances, and the name of the subnet where the VM will be deployed.

- **`vm_username`**: The username to access the virtual machine, you can load this value using the environment variable `TF_VAR_vm_username`.

- **`vm_password`**: The password to access the virtual machines, you can load this value using the environment variable `TF_VAR_vm_password`.

- **`database`**: An object that contains properties for the database server, including the server name and database name.

For a real-world scenario, it is advisable to externalize these parameters using a `.tfvars` file to allow more flexible configuration and management. This project keeps essential parameters configurable to streamline setup and focus on core functionality.

## Cost Estimation

Estimating costs for this Terraform project involves considering the following Azure resources. The values provided are estimates based on the current configuration and usage assumptions. Please note that costs may vary based on the number of instances, resource properties, and data transfer volumes.

### Microsoft Azure Estimate

| Service Category | Service Type           | Custom Name            | Region   | Description                                                                                                                                                       | Estimated Monthly Cost |
|------------------|-------------------------|-------------------------|----------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------|
| Compute          | Virtual Machines        |                         | East US  | 3 B1s (1 Core, 1 GB RAM) x 730 Hours (Pay as you go), Linux; 3 managed disks – S4; Inter Region transfer type, 0 GB outbound data transfer from East US to East Asia | $27.38                  |
| Databases        | Azure SQL Database      |                         | East US  | Single Database, vCore, General Purpose, Provisioned, Standard-series (Gen 5), Primary or Geo replica Disaster Recovery, Locally Redundant, 1 - 2 vCore Database(s) x 730 Hours, 30 GB Storage, SQL License (Pay as you go), LRS Backup Storage Redundancy, 0 GB Point-In-Time Restore, 0 x 0 GB Long Term Retention | $372.67                 |
| Networking       | Virtual Network         |                         | East US  | Virtual Network 1: 100 GB Outbound Data Transfer; Virtual Network 2: 100 GB Outbound Data Transfer                                                                 | $4.00                   |
| Networking       | Load Balancer           |                         | East US  | Standard Tier: 2 Rules, 1,000 GB Data Processed                                                                                                                   | $23.25                  |
| Networking       | IP Addresses            |                         | East US  | Standard (ARM), 0 Static IP Addresses X 730 Hours, 2 Public IP Prefixes X 730 Hours                                                                             | $8.76                   |
| **Total**        |                         |                         |          |                                                                                                                                                                   | **$436.07**             |

This estimate is for the defined resources in this project. Alterations to the number of instances or resource properties will change the cost, as will variations in data transfer amounts.
