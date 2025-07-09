variable "resource_group_name" {
  type        = string
  description = "Name of the resource group where VNet will be created"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "vnet_name" {
  type        = string
  description = "Name of the virtual network"
}

variable "address_space" {
  type        = list(string)
  description = "Address space of the virtual network"
}

variable "subnet_name" {
  type        = string
  description = "Name of the subnet"
}

variable "subnet_prefixes" {
  type        = list(string)
  description = "Address prefixes of the subnet"
}

variable "nsg_name" {
  type        = string
  description = "Name of the Network Security Group"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to all resources"
}
