terraform {
  backend "azurerm" {
    resource_group_name   = "tfstateN01683837RG"
    storage_account_name  = "tfstaten01683837sa"
    container_name        = "tfstate"
    key                   = "assignment1-3837.tfstate"
  }
}
