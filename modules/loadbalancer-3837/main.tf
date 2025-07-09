resource "azurerm_public_ip" "load_balancer_public_ip" {
  name                = "public-ip-loadbalancer-3837"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Basic"

  tags = var.tags
}

resource "azurerm_lb" "linux_vm_load_balancer" {
  name                = "loadbalancer-3837"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Basic"

  frontend_ip_configuration {
    name                 = "PublicFrontEnd"
    public_ip_address_id = azurerm_public_ip.load_balancer_public_ip.id
  }

  tags = var.tags
}

resource "azurerm_lb_backend_address_pool" "linux_vm_backend_pool" {
  name                = "backend-pool-3837"
  loadbalancer_id     = azurerm_lb.linux_vm_load_balancer.id
  resource_group_name = var.resource_group_name
}

resource "azurerm_network_interface_backend_address_pool_association" "linux_vm_backend_association" {
  for_each                = toset(var.linux_nic_ids)
  network_interface_id    = each.key
  ip_configuration_name   = "primary"
  backend_address_pool_id = azurerm_lb_backend_address_pool.linux_vm_backend_pool.id
}

