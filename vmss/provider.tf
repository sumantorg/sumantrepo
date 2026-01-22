terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.57.0"
    }
    tls = {
      source = "hashicorp/tls"
    }
      local = {
        source = "hashicorp/local"
  }
}
}

provider "azurerm" {
  features{}
  subscription_id = "e5d1bf06-2bcf-4e00-8726-642d749c8d04"

}