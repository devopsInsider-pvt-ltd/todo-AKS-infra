locals {
  common_tags = {
    "ManagedBy" = "Terraform"
    "Owner" = "todoappteam"
    "env" = "dev"
  }
}

module "rg" {
  source = "../../child-module/azurerm_resource_group"
  rg_name = "sandy-aks-rg"
  location = "West Us2"
  tags = local.common_tags
}

module "acr" {
  depends_on = [ module.rg ]
  source = "../../child-module/azurerm_container_registry"
  acr_name = "sandyacr5"
  rg_name = "sandy-aks-rg"
  location = "West Us2"
  tags = local.common_tags
}

module "sql-server" {
  depends_on = [ module.rg ]
  source = "../../child-module/azurerm_sql_server"
  sql_server_name = "sandy-sql-server"
  rg_name = "sandy-aks-rg"
  location = "West Us2"
  admin_username = "sql-admin"
  admin_password = "Nokia@2134"
  tags = local.common_tags
}

module "sql-db" {
  depends_on = [ module.sql-server ]
  source = "../../child-module/azurerm_sql_database"
  sql_db_name = "sandy-sdl-db"
  server_id = module.sql-server.server_id
  max_size_gb = "2"
  tags = local.common_tags
}

module "aks" {
  depends_on = [ module.rg ]
  source = "../../child-module/azurerm_kubernates_cluster"
  aks_name = "sandy-aks"
  location = "West Us2"
  rg_name = "sandy-aks-rg"
  dns_prefix = "sandy-aks"
  tags = local.common_tags
}