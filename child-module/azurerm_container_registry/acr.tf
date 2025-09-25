resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = var.rg_name
  location            = var.location
  sku                 = "Premium"
  admin_enabled       = false
  tags =  var.tags
}

variable "acr_name" {
  type = string
}
variable "rg_name" {
  type = string
}
variable "location" {
  type = string
}
variable "tags" {
  type = map(string)
}