output "postgresql_server_name" {
  value       = azurerm_postgresql_server.postgres_server.name
  description = "The name of the Azure PostgreSQL Single Server"
}

