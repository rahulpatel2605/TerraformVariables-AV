terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.73.0"
    }
  }
}

provider "azurerm" {
    #subscription_id = "f5c4dbcf-g9d9-4f4c-c7ab-21bf9a7a80e0"
  #skip_provider_registration = true # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "app-rg"
  location = "Central India"
}

resource "azurerm_storage_account" "storageac" {
  name                     = var.name_value
  resource_group_name      = var.resource_group_name_value
  location                 = var.location_value
  account_tier             = var.account_tier_value
  account_replication_type = var.account_replication_type_value
  depends_on = [ azurerm_resource_group.rg ]
}