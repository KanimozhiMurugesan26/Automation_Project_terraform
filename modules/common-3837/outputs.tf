output "log_analytics_workspace_name" {
  value       = azurerm_log_analytics_workspace.log_analytics_3837.name
  description = "Name of the Log Analytics Workspace"
}

output "recovery_services_vault_name" {
  value       = azurerm_recovery_services_vault.vault_3837.name
  description = "Name of the Recovery Services Vault"
}

output "storage_account_name" {
  value       = azurerm_storage_account.storage_3837.name
  description = "Name of the Storage Account"
}

output "storage_account_uri" {
  value       = azurerm_storage_account.storage_3837.primary_blob_endpoint
  description = "Storage URI for use with boot diagnostics"
}

