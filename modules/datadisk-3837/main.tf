resource "azurerm_managed_disk" "vm_data_disk" {
  count                = 4
  name                 = "datadisk-${count.index + 1}-3837"
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = 10
  tags                 = var.tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "vm_disk_attachment" {
  count              = 4
  managed_disk_id    = azurerm_managed_disk.vm_data_disk[count.index].id
  virtual_machine_id = var.vm_ids[count.index]
  lun                = 10 + count.index
  caching            = "ReadWrite"
}

