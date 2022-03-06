terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }

  backend "azurerm" {
    resource_group_name  = "adp-c-dev-devops"
    storage_account_name = "adpcdevdevopssa"
    container_name       = "tfstate"
    key                  = "adp-devops.tfstate"
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}

}

