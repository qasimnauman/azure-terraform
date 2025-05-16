# ACR

subscription_id = "08ac9f34-82f5-407c-9442-5f9351491b3d"

acr_name                      = "zpaydonline"
network_rule_bypass_option    = "AzureServices"
public_network_access_enabled = true
quarantine_policy_enabled     = false
acr_sku                       = "Standard"
acr_admin_enabled             = true
anonymous_pull_enabled        = false
data_endpoint_enabled         = false
export_policy_enabled         = true
acr_zone_redundancy_enabled   = false

acrtags = {
  CreatedBy = "qasim"
  Name      = "zpaydonline"
}

# subscription_id = "08ac9f34-82f5-407c-9442-5f9351491b3d"


# AKS

# resource_group_name = "zpayd-online"
location = "Canada Central"
# cluster_name        = "zpayd-online"

aks_sku_tier                                  = "Standard"
aks_local_account_disabled                    = false
automatic_channel_upgrade                     = "patch"
node_os_channel_upgrade                       = "NodeImage"
aks_azure_policy_enabled                      = true
aks_workload_identity_enabled                 = true
aks_image_cleaner_enabled                     = true
aks_support_plan                              = "KubernetesOfficial"
aks_oidc_issuer_enabled                       = true
aks_role_based_access_control_enabled         = true
aks_private_cluster_enabled                   = false
aks_oms_agent_msi_auth_for_monitoring_enabled = true
aks_web_app_routing_dns_zone_ids              = []

key_vault_secrets_provider_secret_rotation          = false
key_vault_secrets_provider_secret_rotation_interval = "2m"

aks_identity_type                   = "SystemAssigned"
monitor_metrics_annotations_allowed = true
monitor_metrics_labels_allowed      = true

network_profile_dns_service_ip      = "10.0.0.10"
network_profile_ip_versions         = ["IPv4"]
network_profile_load_balancer_sku   = "standard"
network_profile_network_data_plane  = "azure"
network_profile_network_plugin      = "azure"
network_profile_network_plugin_mode = "overlay"
network_profile_outbound_type       = "loadBalancer"
network_profile_pod_cidr            = "10.244.0.0/16"
network_profile_pod_cidrs           = ["10.244.0.0/16"]
network_profile_service_cidr        = "10.0.0.0/16"
network_profile_service_cidrs       = ["10.0.0.0/16"]

# network_profile_load_balancer_profile_managed_outbound_ip_count     = 1
# network_profile_load_balancer_profile_idle_timeout_in_minutes       = 0
# network_profile_load_balancer_profile_managed_outbound_ipv6_count   = 0
# network_profile_load_balancer_profile_outbound_ip_address_ids       = []
# network_profile_load_balancer_profile_outbound_ip_prefix_ids        = []
# network_profile_load_balancer_profile_outbound_ports_allocated      = 0

default_node_pool_name                  = "System"
default_node_pool_os_sku                = "Ubuntu"
default_node_pool_zones                 = ["1", "2", "3"]
default_node_pool_enable_auto_scaling   = true
default_node_pool_scale_down_mode       = "Delete"
default_node_pool_vm_size               = "Standard_D4as_v5"
default_node_pool_min_count             = 1
default_node_pool_max_count             = 5
default_node_pool_enable_node_public_ip = false
default_node_pool_max_pods              = 55
default_node_pool_os_disk_size_gb       = 128
default_node_pool_os_disk_type          = "Managed"
default_node_pool_orchestrator_version  = "1.37.1"
default_node_pool_node_taints           = []

# default_node_pool_tags = {
#   CreatedBy = "qasim"
#   Name      = "zpaydonlineagent-np"
# }

# default_node_pool_node_labels = {
#   CreatedBy = "qasim"
#   Name      = "zpaydonlineagent-np"
# }

# vnet_subnet_id = "REPLACE-WITH-SUBNET-ID"

workload_autoscaler_profile_keda_enabled                    = true
workload_autoscaler_profile_vertical_pod_autoscaler_enabled = true

userpool_name                  = "userpool"
userpool_mode                  = "User"
userpool_vm_size               = "Standard_D4as_v5"
userpool_os_disk_size_gb       = 128
userpool_os_disk_type          = "Managed"
userpool_os_type               = "Linux"
userpool_os_sku                = "Ubuntu"
userpool_zones                 = ["1", "2", "3"]
userpool_enable_auto_scaling   = true
userpool_scale_down_mode       = "Delete"
userpool_min_count             = 1
userpool_max_count             = 5
userpool_enable_node_public_ip = false
userpool_max_pods              = 110
userpool_orchestrator_version  = "1.31.7"
userpool_node_taints           = []

# userpool_vnet_subnet_id = ""
# userpool_tags = {
#   CreatedBy = "qasim"
#   Name      = "zpaydonline-user-np"
# }

# userpool_node_labels = {
#   CreatedBy = "qasim"
#   Name      = "zpaydonline-user-np"
# }

# log_analytics_workspace_id                  = "zpayd-online-log-analytics"
# log_analytics_workspace_sku                 = "PerGB2018"
# log_analytics_workspace_retention_in_days   = 30

# akstags = {
#   CreatedBy = "qasim"
#   Name      = "zpaydonlineaks"
# }


# containerappsenv

# Basic Configuration
# container_apps_env_name = "zpayd-online-ca-env"
# resource_group_name     = "zpayd-online"
# location                = "Canada Central"

# Container App Environment Settings
ca_env_zone_redundancy_enabled         = false
internal_load_balancer_enabled_aca_env = false
mutual_tls_enabled                     = false

# Log Analytics Workspace (replace with your actual ID if different)
# log_analytics_workspace_id = "/subscriptions/08ac9f34-82f5-407c-9442-5f9351491b3d/resourceGroups/zpayd-online/providers/Microsoft.OperationalInsights/workspaces/zpayd-online-law"

# Tags
# container_env_tags = {
#   CreatedBy = "qasim"
#   Name      = "zpayd-online-ca-env"
# }

# Log analytics workspace

# workspace_name     = "zpayd-online-log-analytics"
log_analytics_sku = "PerGB2018"
retention_in_days = 30

# RG

# rg_name = "zpayd-online"

# location = "Canada Central"

# rgtags = {
#   environment = "dev"
#   owner       = "zpayd"
# }


# containerapps

# Basic Info
# ca_name                    = terraform.workspace == "production" ? "zpayd-online" : "zpayd-online-${terraform.workspace}"
revision_mode          = "Single"
max_inactive_revisions = 5

# containerapp_tags = {
#   CreatedBy = "qasim"
#   Name      = "zpayd-online-ca"
# }
# Workload Profile
workload_profile_name = "Consumption"

# Container App Environment ID
# container_app_environment_id = "/subscriptions/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/resourceGroups/zpayd-online-resource/providers/Microsoft.App/managedEnvironments/zpayd-app-env"

# Ingress
ingress_allow_insecure_connections     = true
ingress_exposed_port                   = 0
ingress_external_enabled               = true
ingress_target_port                    = 80
ingress_transport                      = "auto"
ingress_traffic_weight_label           = "stable"
ingress_traffic_weight_latest_revision = true
ingress_traffic_weight_percentage      = 100
ingress_traffic_weight_revision_suffix = "v1"

# Registry
# registry_identity             = ""
registry_server               = "zpaydonlinecr.azurecr.io"
registry_username             = ""
# registry_password_secret_name = ""

# Template
template_max_replicas                     = 100
template_min_replicas                     = 2
template_revision_suffix                  = "v1"
template_termination_grace_period_seconds = 30

# Container Config
# template_container_name    = "zpayd-online-ca"
template_container_image   = "zpaydonlinecr.azurecr.io/zpayd-online:b7f54eec3a4741c7815befe6cfde91340a06e557"
# template_container_cpu     = 2
# template_container_memory  = "4Gi"
template_container_args    = []
template_container_command = []

# HTTP Scale Rule
template_http_scale_rule_name                = "http-scaler"
template_http_scale_rule_concurrent_requests = 10


# SQL Server
# sql_flexible_server_name         = "zpayd-online"
sql_backup_retention_days        = 7
sql_geo_redundant_backup_enabled = false
sql_replication_role             = "None"
sql_sku_name                     = "B_Standard_B1ms"
sql_storage_auto_grow_enabled    = true
sql_io_scaling_enabled           = true
sql_iops                         = 360
sql_storage_size_gb              = 20
# sql_tags = {
#   CreatedBy = "qasim"
#   Name      = "zpaydonline-sql"
# }
sql_version = "8.0.21"
