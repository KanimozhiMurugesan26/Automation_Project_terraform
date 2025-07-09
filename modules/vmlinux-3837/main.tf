resource "azurerm_availability_set" "linux_vm_availability_set" {
  name                         = var.availability_set_name
  location                     = var.location
  resource_group_name          = var.resource_group_name
  platform_fault_domain_count  = 2
  platform_update_domain_count = 2
  managed                      = true
  tags                         = var.tags
}

resource "azurerm_public_ip" "linux_vm_public_ip" {
  for_each            = toset(var.vm_names)
  name                = "${each.key}-public-ip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
  domain_name_label   = var.dns_labels[index(var.vm_names, each.key)]
  tags                = var.tags
}

resource "azurerm_network_interface" "linux_vm_network_interface" {
  for_each            = toset(var.vm_names)
  name                = "${each.key}-network-interface"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "primary"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.linux_vm_public_ip[each.key].id
  }

  tags = var.tags
}

resource "azurerm_linux_virtual_machine" "linux_virtual_machine" {
  for_each                     = toset(var.vm_names)
  name                         = each.key
  location                     = var.location
  resource_group_name          = var.resource_group_name
  size                         = "Standard_B1ms"
  availability_set_id          = azurerm_availability_set.linux_vm_availability_set.id
  admin_username               = var.admin_username
  admin_password               = var.admin_password
  disable_password_authentication = false

  network_interface_ids = [
    azurerm_network_interface.linux_vm_network_interface[each.key].id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "OpenLogic"
    offer     = "CentOS"
    sku       = "8_2"
    version   = "latest"
  }

  boot_diagnostics {
    storage_account_uri = var.storage_account_uri
  }

  tags = var.tags
}

resource "azurerm_virtual_machine_extension" "network_watcher_extension" {
  for_each              = toset(var.vm_names)
  name                  = "NetworkWatcherAgent"
  virtual_machine_id    = azurerm_linux_virtual_machine.linux_virtual_machine[each.key].id
  publisher             = "Microsoft.Azure.NetworkWatcher"
  type                  = "NetworkWatcherAgentLinux"
  type_handler_version  = "1.0"
  auto_upgrade_minor_version = true
}

resource "azurerm_virtual_machine_extension" "azure_monitor_extension" {
  for_each              = toset(var.vm_names)
  name                  = "AzureMonitorLinuxAgent"
  virtual_machine_id    = azurerm_linux_virtual_machine.linux_virtual_machine[each.key].id
  publisher             = "Microsoft.Azure.Monitor"
  type                  = "AzureMonitorLinuxAgent"
  type_handler_version  = "1.0"
  auto_upgrade_minor_version = true
}

resource "null_resource" "display_linux_vm_hostname" {
  for_each = toset(var.vm_names)

  connection {
    type     = "ssh"
    user     = var.admin_username
    password = var.admin_password
    host     = azurerm_public_ip.linux_vm_public_ip[each.key].ip_address
  }

  provisioner "remote-exec" {
    inline = ["echo Connected to: $(hostname)"]
  }

  depends_on = [azurerm_linux_virtual_machine.linux_virtual_machine]
}

