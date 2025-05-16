resource_group_name = "zpayd-online"
location            = "Canada Central"
cluster_name        = "zpayd-online"

aks_sku_tier                        = "Standard"
aks_local_account_disabled         = false
automatic_channel_upgrade          = "patch"
node_os_channel_upgrade            = "NodeImage"
aks_azure_policy_enabled           = true
aks_workload_identity_enabled      = true
aks_image_cleaner_enabled          = true
aks_support_plan                   = "KubernetesOfficial"
aks_oidc_issuer_enabled            = true
aks_role_based_access_control_enabled = true
aks_private_cluster_enabled        = false
aks_oms_agent_msi_auth_for_monitoring_enabled = true
aks_web_app_routing_dns_zone_ids   = []

key_vault_secrets_provider_secret_rotation           = false
key_vault_secrets_provider_secret_rotation_interval  = "2m"

aks_identity_type                  = "SystemAssigned"
monitor_metrics_annotations_allowed = true
monitor_metrics_labels_allowed    = true

network_profile_dns_service_ip    = "10.0.0.10"
network_profile_ip_versions       = ["IPv4"]
network_profile_load_balancer_sku = "standard"
network_profile_network_data_plane = "azure"
network_profile_network_plugin    = "azure"
network_profile_network_plugin_mode = "overlay"
network_profile_outbound_type     = "loadBalancer"
network_profile_pod_cidr          = "10.244.0.0/16"
network_profile_pod_cidrs         = ["10.244.0.0/16"]
network_profile_service_cidr      = "10.0.0.0/16"
network_profile_service_cidrs     = ["10.0.0.0/16"]

# network_profile_load_balancer_profile_managed_outbound_ip_count     = 1
# network_profile_load_balancer_profile_idle_timeout_in_minutes       = 0
# network_profile_load_balancer_profile_managed_outbound_ipv6_count   = 0
# network_profile_load_balancer_profile_outbound_ip_address_ids       = []
# network_profile_load_balancer_profile_outbound_ip_prefix_ids        = []
# network_profile_load_balancer_profile_outbound_ports_allocated      = 0

default_node_pool_name             = "System"
default_node_pool_os_sku           = "Ubuntu"
default_node_pool_zones            = ["1", "2", "3"]
default_node_pool_enable_auto_scaling = true
default_node_pool_scale_down_mode  = "Delete"
default_node_pool_vm_size          = "Standard_D4as_v5"
default_node_pool_min_count        = 1
default_node_pool_max_count        = 5
default_node_pool_enable_node_public_ip = false
default_node_pool_max_pods         = 55
default_node_pool_os_disk_size_gb  = 128
default_node_pool_os_disk_type     = "Managed"
default_node_pool_orchestrator_version = "1.37.1"
default_node_pool_node_taints      = []

default_node_pool_tags = {
  CreatedBy = "qasim"
  Name      = "zpaydonlineagent-np"
}

default_node_pool_node_labels = {
  CreatedBy = "qasim"
  Name      = "zpaydonlineagent-np"
}

# vnet_subnet_id = "REPLACE-WITH-SUBNET-ID"

workload_autoscaler_profile_keda_enabled = true
workload_autoscaler_profile_vertical_pod_autoscaler_enabled = true

userpool_name              = "userpool"
userpool_mode              = "User"
userpool_vm_size           = "Standard_D4as_v5"
userpool_os_disk_size_gb   = 128
userpool_os_disk_type      = "Managed"
userpool_os_type           = "Linux"
userpool_os_sku            = "Ubuntu"
userpool_zones             = ["1", "2", "3"]
userpool_enable_auto_scaling = true
userpool_scale_down_mode   = "Delete"
userpool_min_count         = 1
userpool_max_count         = 5
userpool_enable_node_public_ip = false
userpool_max_pods          = 110
userpool_orchestrator_version = "1.31.7"
userpool_node_taints       = []

userpool_vnet_subnet_id = ""
userpool_tags = {
  CreatedBy = "qasim"
  Name      = "zpaydonline-user-np"
}

userpool_node_labels = {
  CreatedBy = "qasim"
  Name      = "zpaydonline-user-np"
}

log_analytics_workspace_id                  = "zpayd-online-log-analytics"
log_analytics_workspace_sku                 = "PerGB2018"
log_analytics_workspace_retention_in_days   = 30

akstags = {
  CreatedBy = "qasim"
  Name      = "zpaydonlineaks"
}
