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

module "resource_group" {
  source = "../module/resource_group"
  rg_name = var.rg_name
  rg_location = var.rg_location
}