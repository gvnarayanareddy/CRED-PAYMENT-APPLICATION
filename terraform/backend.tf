terraform {

  backend "azurerm" {
    resource_group_name  = "CREDRG"
    storage_account_name = "stroagecred123"
    container_name       = "satefile"
    key                  = "cred.terraform.tfstate"
  }
}