resource "azurerm_storage_account" "storage" {
    name = var.storage_name
    resource_group_name = var.rg_name
    location = var.location
    account_tier = "Standard"
    account_replication_type = "LRS"
    tags = var.tags
}

variable "storage_name" {
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