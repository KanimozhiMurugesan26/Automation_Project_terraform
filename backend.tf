terraform {
  backend "azurerm" {
    resource_group_name   = "n01683837-Backend-RG"
    storage_account_name  = "tfbackend3837"
    container_name        = "tfstate"
    key                   = "assignment1-3837.tfstate"
  }
}
