module "vm" {
  source = "./modules/linux-virtual-machine"
  count = length(var.virtual_machine)
  name = var.virtual_machine[count.index].name
  instances = var.virtual_machine[count.index].instances
  size = var.virtual_machine[count.index].size
  credentials = {username = var.vm_username, password = var.vm_password}
  resource_group_name = module.rg.name
  location = var.location
  subnet_id = module.vnet.subnets[var.virtual_machine[count.index].subnet_name]
}