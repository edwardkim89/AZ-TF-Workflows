# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1.0"


cloud {
  organization = "platformdeveddy"
  workspaces {
    name = "learn-terraform-azure"
  }
}

}

provider "azurerm" {
  features {} 

}

#Create a resource group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = "westus2"

  #Ex. of Tag for azurerm_resource_group 
  tags = {
    Environment = "Terraform Getting Started"
    Team = "DevOps"
  }
}

# Create a virtual network
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet
  address_space       = ["10.0.0.0/16"]
  location            = "westus2"
  resource_group_name = azurerm_resource_group.rg.name

  #Ex. of Tag for azurerm_virtual_network
  tags = {
    Environment = "TF Azure Virtual Network Example"
    Team = "Networking"
  }
}
