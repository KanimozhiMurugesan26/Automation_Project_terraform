output "vnet_name" {
  value       = azurerm_virtual_network.vnet_3837.name
  description = "The name of the Virtual Network"
}

output "subnet_name" {
  value       = azurerm_subnet.subnet_3837.name
  description = "The name of the Subnet"
}

output "subnet_id" {
  value       = azurerm_subnet.subnet_3837.id
  description = "ID of the Subnet for other modules"
}

