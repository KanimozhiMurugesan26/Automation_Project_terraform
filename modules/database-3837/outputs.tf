output "postgresql_server_name" {
  value       = azurerm_postgresql_flexible_server.postgres_server.name
  description = "The name of the Azure PostgreSQL Single Server"
}

