output "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics Workspace"
  value       = azurerm_log_analytics_workspace.zpayd-online.id
}

output "log_analytics_workspace_sku" {
  description = "The SKU of the Log Analytics Workspace"
  value       = azurerm_log_analytics_workspace.zpayd-online.sku
}

output "log_analytics_workspace_retention_in_days" {
  description = "The retention period (in days) of the Log Analytics Workspace"
  value       = azurerm_log_analytics_workspace.zpayd-online.retention_in_days
}
