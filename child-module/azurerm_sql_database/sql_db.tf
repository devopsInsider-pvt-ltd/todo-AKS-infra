resource "azurerm_mssql_database" "database" {
  name         = var.sql_db_name
  server_id    = var.server_id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = var.max_size_gb
  sku_name     = "S0"
  enclave_type = "VBS"
  tags = var.tags
}

variable "sql_db_name" {
  type = string
}
variable "server_id" {
  type = string
}
variable "max_size_gb" {

}
variable "tags" {
  type = map(string)
}