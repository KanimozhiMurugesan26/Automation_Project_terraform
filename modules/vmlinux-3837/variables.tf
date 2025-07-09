variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "vm_names" {
  type = list(string)
}

variable "dns_labels" {
  type = list(string)
}

variable "availability_set_name" {
  type = string
}

variable "admin_username" {
  type = string
}

variable "admin_password" {
  type      = string
  sensitive = true
}

variable "storage_account_uri" {
  type = string
}

variable "tags" {
  type = map(string)
}

