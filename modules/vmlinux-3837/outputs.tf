output "linux_vm_hostnames" {
  value = [for vm in azurerm_linux_virtual_machine.linux_virtual_machine : vm.name]
  description = "List of Linux VM hostnames"
}

output "linux_vm_private_ips" {
  value = [for nic in azurerm_network_interface.linux_vm_network_interface : nic.ip_configuration[0].private_ip_address]
  description = "Private IPs of the Linux VMs"
}

output "linux_vm_public_ips" {
  value = [for ip in azurerm_public_ip.linux_vm_public_ip : ip.ip_address]
  description = "Public IPs of the Linux VMs"
}

output "linux_vm_fqdns" {
  value = [for ip in azurerm_public_ip.linux_vm_public_ip : ip.fqdn]
  description = "FQDNs of the Linux VMs"
}

output "vm_ids" {
  value = [for vm in azurerm_linux_virtual_machine.linux_virtual_machine : vm.id]
}

output "linux_nic_ids" {
  value = [for nic in azurerm_network_interface.linux_vm_network_interface : nic.id]
  description = "List of Linux VM NIC IDs for Load Balancer"
}



