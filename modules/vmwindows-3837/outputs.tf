output "windows_vm_hostname" {
  value       = azurerm_windows_virtual_machine.windows_virtual_machine[0].name
  description = "Hostname of the Windows VM"
}

output "windows_vm_private_ip" {
  value       = azurerm_network_interface.windows_vm_network_interface.ip_configuration[0].private_ip_address
  description = "Private IP address of the Windows VM"
}

output "windows_vm_public_ip" {
  value       = azurerm_public_ip.windows_vm_public_ip.ip_address
  description = "Public IP address of the Windows VM"
}

output "windows_vm_fqdn" {
  value       = azurerm_public_ip.windows_vm_public_ip.fqdn
  description = "FQDN of the Windows VM"
}

output "vm_id" {
  value = azurerm_windows_virtual_machine.windows_virtual_machine[0].id
}


