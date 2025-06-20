terraform {
  backend "azurerm" {
    resource_group_name  = "om-rg-01"
    storage_account_name = "omsa01"
    container_name       = "tfstate"
    key                  = "" # Placeholder to be filled by config file
  }
}