resource "azurerm_public_ip" "pip" {
  name                = "web-lb-pip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku = "Standard"
}

resource "azurerm_lb" "lb" {
  name = var.name
  location = var.location
  resource_group_name = var.resource_group_name
  sku = "Standard"

  frontend_ip_configuration {
    name = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.pip.id
  }
}

resource "azurerm_lb_backend_address_pool" "lb_pool" {
  loadbalancer_id      = azurerm_lb.lb.id
  name                 = "frontend-pool"
}

resource "azurerm_network_interface_backend_address_pool_association" "nic_lb_pool" {
  count = var.backend_nics_count
  network_interface_id    = var.backend_nics[count.index]
  ip_configuration_name   = "default"
  backend_address_pool_id = azurerm_lb_backend_address_pool.lb_pool.id
}

resource "azurerm_lb_probe" "lb_probe" {
  loadbalancer_id = azurerm_lb.lb.id
  name = "frontend-lb-probe"
  port = 80
}

resource "azurerm_lb_rule" "lb_rule" {
  loadbalancer_id = azurerm_lb.lb.id
  name = "frontend-rule"
  protocol = "Tcp"
  frontend_port = 80
  backend_port = 80
  disable_outbound_snat = true
  frontend_ip_configuration_name = azurerm_lb.lb.frontend_ip_configuration[0].name
  probe_id = azurerm_lb_probe.lb_probe.id
  backend_address_pool_ids = [azurerm_lb_backend_address_pool.lb_pool.id]
}

resource "azurerm_lb_outbound_rule" "lboutbound_rule" {
  name                    = "frontend-outbound-rule"
  loadbalancer_id         = azurerm_lb.lb.id
  protocol                = "All"
  backend_address_pool_id = azurerm_lb_backend_address_pool.lb_pool.id

  frontend_ip_configuration {
    name = "PublicIPAddress"
  }
}