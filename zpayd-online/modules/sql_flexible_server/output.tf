output "sql_flexible_server_name" {
  value = azurerm_mysql_flexible_server.sql_server.name
}

output "sql_flexible_server_id" {
  value = azurerm_mysql_flexible_server.sql_server.id
}

output "sql_flexible_server_hostname" {
  value = azurerm_mysql_flexible_server.sql_server.fqdn
}
