terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.107.0"
    }
  }

  backend "azurerm" {
  }
}

provider "azurerm" {
  features {}
}

module "rg" {
  source        = "./modules/resource-group"
  naming_prefix = "${var.environment}-${var.naming_prefix}"
  location      = var.location
}
