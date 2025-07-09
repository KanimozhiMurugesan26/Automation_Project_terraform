output "data_disk_ids" {
  value       = [for disk in azurerm_managed_disk.vm_data_disk : disk.id]
  description = "IDs of the managed data disks created"
}

