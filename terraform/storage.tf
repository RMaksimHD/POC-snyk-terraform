terraform {
  backend "azurerm" {}
  required_version = "~>1.11"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.31.0"
    }
  }
}

provider "azurerm" {
  use_oidc = true
  features {}
}

resource "azurerm_storage_account" "this" {
  name                       = "storagename1"
  resource_group_name        = "rgname"
  location                   = "EastUs"
  account_kind               = "StorageV2"
  account_tier               = "Standard"
  access_tier                = "Hot"
  account_replication_type   = "ZRS"
  https_traffic_only_enabled = true
}

