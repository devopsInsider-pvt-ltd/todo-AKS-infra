terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "4.27.0"
    }
  }
  backend "azurerm" {
    resource_group_name = "sandystor-rg"
    storage_account_name = "sandystora2"
    container_name = "blob"
    key = "aks.tfstate"
  }
}


provider "azurerm" {
  features {}
  subscription_id = "e5776277-6d0c-4f2c-97d3-a378ac7502d6"
}