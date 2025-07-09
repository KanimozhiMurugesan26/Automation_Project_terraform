output "load_balancer_name" {
  value       = azurerm_lb.linux_vm_load_balancer.name
  description = "Name of the public load balancer"
}

