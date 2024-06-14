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
    container_name       = "vnet-terraform-state"
    key                  = "vnet_terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

data "terraform_remote_state" "rg" {
  backend = "azurerm"
  config = {
    resource_group_name  = "TF_Remote_State_2024_RG"
    storage_account_name = "tflearnremotestatestacc"
    container_name       = "rg-terraform-state"
    key                  = "rg_terraform.tfstate"
  }
}

data "azurerm_resource_group" "exist_rg" {
  name = data.terraform_remote_state.rg.outputs.rg_details.rg_details.name
}

resource "azurerm_virtual_network" "vnet" {
  name     = var.vnet_name
  location = data.azurerm_resource_group.exist_rg.name
  resource_group_name = data.azurerm_resource_group.exist_rg.location
  address_space = var.vnet_address_space
}
