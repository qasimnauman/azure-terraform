resource "azurerm_mysql_flexible_server" "sql_server" {
  administrator_login               = var.sql_admin_name
  administrator_password            = var.sql_admin_password
  backup_retention_days             = var.sql_backup_retention_days
  geo_redundant_backup_enabled      = var.sql_geo_redundant_backup_enabled
  location                          = var.location
  name                              = var.sql_flexible_server_name
  replication_role                  = var.sql_replication_role
  resource_group_name               = var.resource_group_name
  sku_name                          = var.sql_sku_name
  tags = var.sql_tags
  version = var.sql_version
  storage {
    auto_grow_enabled  = var.sql_storage_auto_grow_enabled
    io_scaling_enabled = var.sql_io_scaling_enabled
    iops               = var.sql_iops
    size_gb            = var.sql_storage_size_gb
  }
}
