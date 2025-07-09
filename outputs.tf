output "linux_vm_hostnames" {
  value = module.vmlinux_3837.linux_vm_hostnames
}

output "linux_vm_private_ips" {
  value = module.vmlinux_3837.linux_vm_private_ips
}

output "linux_vm_public_ips" {
  value = module.vmlinux_3837.linux_vm_public_ips
}

output "linux_vm_fqdns" {
  value = module.vmlinux_3837.linux_vm_fqdns
}

output "windows_vm_hostname" {
  value = module.vmwindows_3837.windows_vm_hostname
}

output "windows_vm_private_ip" {
  value = module.vmwindows_3837.windows_vm_private_ip
}

output "windows_vm_public_ip" {
  value = module.vmwindows_3837.windows_vm_public_ip
}

output "windows_vm_fqdn" {
  value = module.vmwindows_3837.windows_vm_fqdn
}

output "load_balancer_name" {
  value = module.loadbalancer_3837.load_balancer_name
}

output "postgresql_server_name" {
  value = module.database_3837.postgresql_server_name
}

