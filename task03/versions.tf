terraform {
  required_version = ">= 1.5.7"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.110.0, < 4.0.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "d656e6fe-d545-4e25-9ccb-23921b4746f8"
  tenant_id       = "b41b72d0-4e9f-4c26-8a69-f949f367c91d"
  client_id       = "82e897e0-195a-4210-bfd5-56ae3c633be8"
  client_secret   = "R~w8Q~EhX6QUkrWsywolSr8jdzZTM5oivL0hobu~"
}