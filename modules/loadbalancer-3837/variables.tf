variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "linux_nic_ids" {
  type        = list(string)
  description = "List of network interface IDs for Linux VMs"
}

variable "tags" {
  type = map(string)
}

