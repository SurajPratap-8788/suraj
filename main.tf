terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
       version = "4.39.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "9098ad9-99a1-43f6-9b36-7c1d79f03953"
} 
  
resource "azurerm_resource_group" "example" {
  name     = "abc-rg"
  location = "West Europe"
}