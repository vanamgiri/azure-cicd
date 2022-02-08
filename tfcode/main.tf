terraform {
  backend "azurerm" {
  }
}


resource "azurerm_resource_group" "rg" {
  name     = "resourcegroup-test-tbd-5"
  location = "eastus2"
}

resource "azurerm_management_group" "ParentMG" {
  display_name = "ParentGroup"

  subscription_ids = [
    data.azurerm_subscription.current.subscription_id,
  ]
}

resource "azurerm_management_group" "ChildMG" {
  display_name               = "ChildGroup"
  parent_management_group_id = azurerm_management_group.ParentMG.id

  subscription_ids = [
    data.azurerm_subscription.current.subscription_id,
  ]
  # other subscription IDs can go here
}


resource "azurerm_virtual_network" "app_network" {
  name                = "app-network"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/16"]

  subnet {
    name           = "privatesubnet1"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "privatesubnet2"
    address_prefix = "10.0.2.0/24"
    
  }

  tags = {
    environment = "Production"
  }
}