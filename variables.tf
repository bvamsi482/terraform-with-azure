provider "azurerm" {
  version         =   "1.39"
}

# variable "client_id" {}
# variable "client_secret" {}
# variable "subscription_id" {}
# variable "tenant_id" {}

variable "rgname" {
  default    =     "Terraform-RG"
}

variable "location" {
  default    =  ["East US", "Central US", "West US"]
}




