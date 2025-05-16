resource "azurerm_container_app_environment" "container_app_env" {
  name                           = var.container_apps_env_name
  location                       = var.location
  resource_group_name            = var.resource_group_name
  log_analytics_workspace_id     = var.log_analytics_workspace_id
  tags                           = var.container_env_tags

  # infrastructure_subnet_id       = var.infrastructure_subnet_id
  # internal_load_balancer_enabled = var.internal_load_balancer_enabled_aca_env
  mutual_tls_enabled             = var.mutual_tls_enabled
  # zone_redundancy_enabled        = var.zone_redundancy_enabled
}
