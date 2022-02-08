terraform {
  backend "azurerm" {
  }
}

resource "azurerm_resource_group" "rg" {
  name     = "resourcegroup-test-tbd-5"
  location = "eastus2"
}


module "vnet" {
  source              = "Azure/vnet/azurerm"
  resource_group_name = resourcegroup-test-tbd-5.rg.name
  address_space       = ["10.0.0.0/24"]
  subnet_prefixes     = ["10.0.0.0/25", "10.0.0.128/25"]
  subnet_names        = ["subnet1-pvt", "subnet2-pvt"]

  subnet_service_endpoints = {
    subnet2 = ["Microsoft.Storage", "Microsoft.Sql"],
    subnet3 = ["Microsoft.AzureActiveDirectory"]
  }

  tags = {
    environment = "dev"
    costcenter  = "it"
  }

  depends_on = [azurerm_resource_group.rg]
}