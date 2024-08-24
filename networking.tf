module "vnet" {
  source              = "./modules/virtual-network"
  naming_prefix       = var.naming_prefix
  location            = var.location
  resource_group_name = module.rg.name
  address_space       = var.virtual_network.address_space
  subnets = var.virtual_network.subnets
}

module "lb" {
  source = "./modules/load-balancer"
  name = "frontend-lb"
  resource_group_name = module.rg.name
  location = var.location
  virtual_network_id = module.vnet.id
  subnet_id = module.vnet.subnets.frontend
  backend_nics_count = [for vm in var.virtual_machine : vm.instances if vm.name == "frontend"][0]
  backend_nics = [for nic_id in flatten(module.vm.*.nic_id) : nic_id if strcontains(nic_id, "frontend-nic")]
}

module "nsg" {
  source = "./modules/network-security-group"
  name = "default-nsg"
  resource_group_name = module.rg.name
  location = var.location
  vnet_address_space = var.virtual_network.address_space
  web_subnet_cidr = [for snet in var.virtual_network.subnets : snet.cidr if snet.name == "frontend"][0]
}

module "nsg_association" {
  source = "./modules/network-security-group-association"
  network_security_group_id = module.nsg.id
  subnets_id = values(module.vnet.subnets)
}