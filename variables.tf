provider "azurerm" {
  client_id       =   var.client_id
  client_secret   =   var.client_secret
  subscription_id =   var.subscription_id
  tenant_id       =   var.tenant_id
}

variable "client_id" {}
variable "client_secret" {}
variable "subscription_id" {}
variable "tenant_id" {}

variable "rgname" {
  default    =     "Terraform-RG"
}

variable "location" {
  default    =  ["East US", "Central US", "West US"]
}




