resource "azurerm_resource_group" "rg" {
    name = var.rg_name
    location = var.location
    tags = var.tags
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