terraform {
  backend "azurerm" {
  }
}

provider "azurerm" {
  # The "feature" block is required for AzureRM provider 2.x.
  features {}
}
resource "azurerm_resource_group" "rg" {
  name     = "resourcegroup-test-tbd"
  location = "eastus2"
}
