module "resource_group" {
  source   = "./modules/resourcegroup"
  rg_name  = local.rg_name
  location = var.location
  tags     = local.rgtags
}

module "acr" {
  source                        = "./modules/acr"
  acr_admin_enabled             = var.acr_admin_enabled
  acr_name                      = var.acr_name
  acr_sku                       = var.acr_sku
  anonymous_pull_enabled        = var.anonymous_pull_enabled
  data_endpoint_enabled         = var.data_endpoint_enabled
  export_policy_enabled         = var.export_policy_enabled
  location                      = var.location
  network_rule_bypass_option    = var.network_rule_bypass_option
  public_network_access_enabled = var.public_network_access_enabled
  quarantine_policy_enabled     = var.quarantine_policy_enabled
  resource_group_name           = module.resource_group.rg_name
  tags                          = var.acrtags
  zone_redundancy_enabled       = var.acr_zone_redundancy_enabled
}

module "vnet" {
  source              = "./modules/vnet"
  location            = var.location
  resource_group_name = module.resource_group.rg_name
  cluster_name        = local.cluster_name
}

module "log_analytics_workspace" {
  source              = "./modules/logananalyticworkspace"
  resource_group_name = module.resource_group.rg_name
  location            = var.location
  workspace_name      = local.workspace_name
  sku                 = var.log_analytics_sku
  retention_in_days   = var.retention_in_days
}

module "aks" {
  depends_on = [module.acr, module.vnet, module.log_analytics_workspace]
  source     = "./modules/aks"

  resource_group_name = module.resource_group.rg_name
  location            = var.location
  cluster_name        = local.cluster_name

  aks_sku_tier                                        = var.aks_sku_tier
  aks_local_account_disabled                          = var.aks_local_account_disabled
  automatic_channel_upgrade                           = var.automatic_channel_upgrade
  node_os_channel_upgrade                             = var.node_os_channel_upgrade
  aks_azure_policy_enabled                            = var.aks_azure_policy_enabled
  aks_workload_identity_enabled                       = var.aks_workload_identity_enabled
  aks_image_cleaner_enabled                           = var.aks_image_cleaner_enabled
  aks_support_plan                                    = var.aks_support_plan
  aks_oidc_issuer_enabled                             = var.aks_oidc_issuer_enabled
  aks_role_based_access_control_enabled               = var.aks_role_based_access_control_enabled
  aks_private_cluster_enabled                         = var.aks_private_cluster_enabled
  aks_oms_agent_msi_auth_for_monitoring_enabled       = var.aks_oms_agent_msi_auth_for_monitoring_enabled
  aks_web_app_routing_dns_zone_ids                    = var.aks_web_app_routing_dns_zone_ids
  key_vault_secrets_provider_secret_rotation          = var.key_vault_secrets_provider_secret_rotation
  key_vault_secrets_provider_secret_rotation_interval = var.key_vault_secrets_provider_secret_rotation_interval
  aks_identity_type                                   = var.aks_identity_type
  monitor_metrics_annotations_allowed                 = var.monitor_metrics_annotations_allowed
  monitor_metrics_labels_allowed                      = var.monitor_metrics_labels_allowed

  # Network Profile
  network_profile_dns_service_ip      = var.network_profile_dns_service_ip
  network_profile_ip_versions         = var.network_profile_ip_versions
  network_profile_load_balancer_sku   = var.network_profile_load_balancer_sku
  network_profile_network_data_plane  = var.network_profile_network_data_plane
  network_profile_network_plugin      = var.network_profile_network_plugin
  network_profile_network_plugin_mode = var.network_profile_network_plugin_mode
  network_profile_outbound_type       = var.network_profile_outbound_type
  network_profile_pod_cidr            = var.network_profile_pod_cidr
  network_profile_pod_cidrs           = var.network_profile_pod_cidrs
  network_profile_service_cidr        = var.network_profile_service_cidr
  network_profile_service_cidrs       = var.network_profile_service_cidrs

  # Default Node Pool
  default_node_pool_name                  = var.default_node_pool_name
  default_node_pool_os_sku                = var.default_node_pool_os_sku
  default_node_pool_zones                 = var.default_node_pool_zones
  default_node_pool_enable_auto_scaling   = var.default_node_pool_enable_auto_scaling
  default_node_pool_scale_down_mode       = var.default_node_pool_scale_down_mode
  default_node_pool_vm_size               = var.default_node_pool_vm_size
  default_node_pool_min_count             = var.default_node_pool_min_count
  default_node_pool_max_count             = var.default_node_pool_max_count
  default_node_pool_enable_node_public_ip = var.default_node_pool_enable_node_public_ip
  default_node_pool_max_pods              = var.default_node_pool_max_pods
  default_node_pool_tags                  = local.default_node_pool_tags
  default_node_pool_os_disk_size_gb       = var.default_node_pool_os_disk_size_gb
  default_node_pool_os_disk_type          = var.default_node_pool_os_disk_type
  default_node_pool_orchestrator_version  = var.default_node_pool_orchestrator_version
  default_node_pool_node_labels           = local.default_node_pool_node_labels
  default_node_pool_node_taints           = var.default_node_pool_node_taints

  vnet_subnet_id = module.vnet.subnet_id

  # AutoScaller KEDA
  workload_autoscaler_profile_keda_enabled                    = var.workload_autoscaler_profile_keda_enabled
  workload_autoscaler_profile_vertical_pod_autoscaler_enabled = var.workload_autoscaler_profile_vertical_pod_autoscaler_enabled

  # User Pool
  userpool_name                  = var.userpool_name
  userpool_mode                  = var.userpool_mode
  userpool_vm_size               = var.userpool_vm_size
  userpool_os_disk_size_gb       = var.userpool_os_disk_size_gb
  userpool_os_disk_type          = var.userpool_os_disk_type
  userpool_os_type               = var.userpool_os_type
  userpool_os_sku                = var.userpool_os_sku
  userpool_zones                 = var.userpool_zones
  userpool_enable_auto_scaling   = var.userpool_enable_auto_scaling
  userpool_scale_down_mode       = var.userpool_scale_down_mode
  userpool_min_count             = var.userpool_min_count
  userpool_max_count             = var.userpool_max_count
  userpool_enable_node_public_ip = var.userpool_enable_node_public_ip
  userpool_max_pods              = var.userpool_max_pods
  userpool_vnet_subnet_id        = module.vnet.subnet_id
  userpool_orchestrator_version  = var.userpool_orchestrator_version
  userpool_tags                  = local.userpool_tags
  userpool_node_labels           = local.userpool_node_labels
  userpool_node_taints           = var.userpool_node_taints

  # Log Analytics Workspace
  log_analytics_workspace_id                = module.log_analytics_workspace.log_analytics_workspace_id
  log_analytics_workspace_sku               = module.log_analytics_workspace.log_analytics_workspace_sku
  log_analytics_workspace_retention_in_days = module.log_analytics_workspace.log_analytics_workspace_retention_in_days

  tags = local.akstags
}

resource "azurerm_role_assignment" "acr_role_assignment" {
  depends_on                       = [module.aks]
  principal_id = module.aks.kubelet_identity[0].object_id
  # principal_id                     = module.aks.kubelet_identity.object_id
  role_definition_name             = "AcrPull"
  scope                            = module.acr.id
  skip_service_principal_aad_check = true
}

module "container_app_environment" {
  source = "./modules/containerappsenv"

  # name                                   = var.container_apps_env_name
  resource_group_name                    = module.resource_group.rg_name
  location                               = var.location
  log_analytics_workspace_id             = module.log_analytics_workspace.log_analytics_workspace_id
  container_env_tags                     = local.container_env_tags
  zone_redundancy_enabled                = var.acr_zone_redundancy_enabled
  internal_load_balancer_enabled_aca_env = var.internal_load_balancer_enabled_aca_env
  mutual_tls_enabled                     = var.mutual_tls_enabled
  # infrastructure_subnet_id               = var.ca_env_infrastructure_subnet_id
}


module "containerapps" {
  source = "./modules/containerapps"

  container_app_environment_id = module.container_app_environment.container_app_env_id
  name                         = local.ca_name
  resource_group_name          = module.resource_group.rg_name
  containerapp_tags            = local.containerapp_tags
  workload_profile_name        = var.workload_profile_name

  ingress_allow_insecure_connections     = var.ingress_allow_insecure_connections
  # ingress_exposed_port                   = var.ingress_exposed_port
  ingress_external_enabled               = var.ingress_external_enabled
  ingress_target_port                    = var.ingress_target_port
  ingress_transport                      = var.ingress_transport
  ingress_traffic_weight_label           = var.ingress_traffic_weight_label
  ingress_traffic_weight_latest_revision = var.ingress_traffic_weight_latest_revision
  # ingress_traffic_weight_percentage      = var.ingress_traffic_weight_percentage
  ingress_traffic_weight_revision_suffix = var.ingress_traffic_weight_revision_suffix

  # registry_identity             = var.registry_identity
  registry_server               = module.acr.acr_server
  registry_username             = module.acr.acradmin
  # registry_password_secret_name = var.registry_password_secret_name

  template_max_replicas                        = var.template_max_replicas
  template_min_replicas                        = var.template_min_replicas
  template_revision_suffix                     = var.template_revision_suffix
  template_termination_grace_period_seconds    = var.template_termination_grace_period_seconds
  template_container_name                      = local.template_container_name
  template_container_image                     = var.template_container_image
  template_container_cpu                       = local.template_container_cpu
  template_container_memory                    = local.template_container_memory
  template_container_args                      = var.template_container_args
  template_container_command                   = var.template_container_command
  template_http_scale_rule_name                = var.template_http_scale_rule_name
  template_http_scale_rule_concurrent_requests = var.template_http_scale_rule_concurrent_requests
}

data "vault_kv_secret_v2" "db_creds" {
  name         = "azuredbcreds"
  mount        = "kv"
}

module "data_base" {
  source = "./modules/sql_flexible_server"
  location = var.location
  resource_group_name = module.resource_group.rg_name
  sql_admin_name = data.vault_kv_secret_v2.db_creds.data["azuredbadmin"]
  sql_admin_password = data.vault_kv_secret_v2.db_creds.data["azuredbpass"]
  sql_flexible_server_name = local.sql_flexible_server_name
  sql_backup_retention_days = var.sql_backup_retention_days
  sql_geo_redundant_backup_enabled = var.sql_geo_redundant_backup_enabled
  sql_version = var.sql_version
  sql_io_scaling_enabled = var.sql_io_scaling_enabled
  sql_replication_role = var.sql_replication_role
  sql_sku_name = var.sql_sku_name
  sql_storage_auto_grow_enabled = var.sql_storage_auto_grow_enabled
  sql_iops = var.sql_iops
  sql_storage_size_gb = var.sql_storage_size_gb
  sql_tags = local.sql_tags
}

# output "name" {
#   value = data.vault_kv_secret_v2.db_creds.data["azuredbpass"]
# }