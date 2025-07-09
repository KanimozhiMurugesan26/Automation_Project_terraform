variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "log_analytics_name" {
  type        = string
  description = "Name of the Log Analytics Workspace"
}

variable "recovery_vault_name" {
  type        = string
  description = "Name of the Recovery Services Vault"
}

variable "storage_account_name" {
  type        = string
  description = "Name of the Storage Account (must not be backend storage)"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to all common resources"
}

