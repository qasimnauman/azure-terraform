# Basic Configuration
container_apps_env_name = "zpayd-online-ca-env"
resource_group_name     = "zpayd-online"
location                = "Canada Central"

# Container App Environment Settings
ca_env_zone_redundancy_enabled           = false
internal_load_balancer_enabled_aca_env = false
mutual_tls_enabled                = false

# Log Analytics Workspace (replace with your actual ID if different)
log_analytics_workspace_id = "/subscriptions/08ac9f34-82f5-407c-9442-5f9351491b3d/resourceGroups/zpayd-online/providers/Microsoft.OperationalInsights/workspaces/zpayd-online-law"

# Tags
container_env_tags = {
  CreatedBy = "qasim"
  Name      = "zpayd-online-ca-env"
}
