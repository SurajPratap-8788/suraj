terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.49.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rgg1"
    storage_account_name = "stgg1"
    container_name       = "mycontainer"
    key                  = "terraform.tfstate"
  }
}
provider "azurerm" {
  features {}
  subscription_id = "3bafb5d4-689a-4313-b617-9f3367263cd7"
}