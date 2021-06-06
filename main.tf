provider "azurerm" {
  features {}
}

terraform {
  required_version = ">= 0.11"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.40.0"
    }
  }
}


resource "azurerm_resource_group" "rg2" {
  name     = var.rg_name
  location = var.rg_location

  tags = {
    "Environment" = "sample"
  }

}

module "msi" {
  source = "./msi"
  
  rg_name=azurerm_resource_group.rg2.name
  msi_name=var.msi_name
}

module "appservice" {
  source = "./appservice"

  appservice_rg=azurerm_resource_group.rg2.name
  app_insights_name=var.app_insights_name
  app_service_planname=var.app_service_planname
  msi_id=module.msi.msi_id
}




