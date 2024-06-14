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


module "vnet" {
  source = "../module/virtual_network"
  vnet_name = var.vnet_name
  vnet_address_space = var.vnet_address_space
}