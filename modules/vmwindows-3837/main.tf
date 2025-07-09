resource "azurerm_availability_set" "windows_vm_availability_set" {
  name                         = var.availability_set_name
  location                     = var.location
  resource_group_name          = var.resource_group_name
  platform_fault_domain_count  = 2
  platform_update_domain_count = 2
  managed                      = true
  tags                         = var.tags
}

resource "azurerm_public_ip" "windows_vm_public_ip" {
  name                = "${var.vm_name}-public-ip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
  domain_name_label   = var.dns_label
  tags                = var.tags
}

resource "azurerm_network_interface" "windows_vm_network_interface" {
  name                = "${var.vm_name}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.windows_vm_public_ip.id
  }

  tags = var.tags
}

resource "azurerm_windows_virtual_machine" "windows_virtual_machine" {
  count                        = 1
  name                         = var.vm_name
  location                     = var.location
  resource_group_name          = var.resource_group_name
  size                         = "Standard_B2s"
  admin_username               = var.admin_username
  admin_password               = var.admin_password
  availability_set_id          = azurerm_availability_set.windows_vm_availability_set.id
  network_interface_ids        = [azurerm_network_interface.windows_vm_network_interface.id]
  provision_vm_agent           = true
  enable_automatic_updates     = true

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }

  boot_diagnostics {
    storage_account_uri = var.storage_account_uri
  }

  tags = var.tags
}

resource "azurerm_virtual_machine_extension" "antimalware_extension" {
  count                = 1
  name                 = "IaaSAntimalware"
  virtual_machine_id   = azurerm_windows_virtual_machine.windows_virtual_machine[0].id
  publisher            = "Microsoft.Azure.Security"
  type                 = "IaaSAntimalware"
  type_handler_version = "1.5"
  auto_upgrade_minor_version = true
}

