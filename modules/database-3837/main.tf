resource "azurerm_postgresql_flexible_server" "postgres_server" {
  name                   = var.db_name
  location               = var.location
  resource_group_name    = var.resource_group_name
  administrator_login    = var.admin_username
  administrator_password = var.admin_password
  version                = "13"
  zone                   = "1"

  storage_mb             = 32768
  sku_name = "B_Standard_B1ms"
  authentication {
    password_auth_enabled = true
  }

  tags = var.tags
}


