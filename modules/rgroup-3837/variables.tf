variable "resource_group_name" {
  type        = string
  description = "Name of the Azure Resource Group"
}

variable "location" {
  type        = string
  description = "Azure region for the resource group"
}

variable "tags" {
  type        = map(string)
  description = "Common tags to apply to the resource group"
}
