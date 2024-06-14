terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }
  required_version = ">= 1.1.0"

   backend "azurerm" {
    resource_group_name  = "TF_Remote_State_2024_RG"
    storage_account_name = "tflearnremotestatestacc"
    container_name       = "rg-terraform-state"
    key                  = "rg_terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.rg_location
}
