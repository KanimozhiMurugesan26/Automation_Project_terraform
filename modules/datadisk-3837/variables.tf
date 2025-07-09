variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "vm_ids" {
  type = list(string)
  description = "List of VM IDs to attach data disks to"
}

variable "tags" {
  type = map(string)
}

