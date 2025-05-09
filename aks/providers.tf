# terraform {
#   required_version = ">=1.0"

#   required_providers {
#     azapi = {
#       source  = "azure/azapi"
#     }
#     azurerm = {
#       source  = "hashicorp/azurerm"
#     }
#     random = {
#       source  = "hashicorp/random"
#     }
#     time = {
#       source  = "hashicorp/time"
#     }
#   }
# }

provider "azurerm" {
  features {}
  skip_provider_registration = true
  subscription_id = var.subscription_id
}