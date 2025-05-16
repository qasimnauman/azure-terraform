resource "azurerm_kubernetes_cluster" "zpayd-online" {
  location                          = var.location
  resource_group_name               = var.resource_group_name
  name                              = var.cluster_name
  sku_tier                          = var.aks_sku_tier
  local_account_disabled            = var.aks_local_account_disabled
  dns_prefix                        = "${var.cluster_name}-dns"
  automatic_channel_upgrade         = var.automatic_channel_upgrade
  node_os_channel_upgrade           = var.node_os_channel_upgrade
  azure_policy_enabled              = var.aks_azure_policy_enabled
  workload_identity_enabled         = var.aks_workload_identity_enabled
  image_cleaner_enabled             = var.aks_image_cleaner_enabled
  support_plan                      = var.aks_support_plan
  oidc_issuer_enabled               = var.aks_oidc_issuer_enabled
  role_based_access_control_enabled = var.aks_role_based_access_control_enabled
  private_cluster_enabled           = var.aks_private_cluster_enabled

  oms_agent {
    log_analytics_workspace_id      = var.log_analytics_workspace_id
    msi_auth_for_monitoring_enabled = var.aks_oms_agent_msi_auth_for_monitoring_enabled
  }

  web_app_routing {
    dns_zone_ids = var.aks_web_app_routing_dns_zone_ids
  }

  tags = var.tags

  key_vault_secrets_provider {
    secret_rotation_enabled  = var.key_vault_secrets_provider_secret_rotation
    secret_rotation_interval = var.key_vault_secrets_provider_secret_rotation_interval
  }

  identity {
    type = var.aks_identity_type
  }

  monitor_metrics {
    annotations_allowed = var.monitor_metrics_annotations_allowed
    labels_allowed      = var.monitor_metrics_labels_allowed
  }


  network_profile {
    dns_service_ip      = var.network_profile_dns_service_ip
    ip_versions         = var.network_profile_ip_versions
    load_balancer_sku   = var.network_profile_load_balancer_sku
    network_data_plane  = var.network_profile_network_data_plane
    network_plugin      = var.network_profile_network_plugin
    network_plugin_mode = var.network_profile_network_plugin_mode
    outbound_type       = var.network_profile_outbound_type
    pod_cidr            = var.network_profile_pod_cidr
    pod_cidrs           = var.network_profile_pod_cidrs
    service_cidr        = var.network_profile_service_cidr
    service_cidrs       = var.network_profile_service_cidrs
    load_balancer_profile {
      managed_outbound_ip_count = var.network_profile_load_balancer_profile_managed_outbound_ip_count
    }
    # load_balancer_profile {
    #   idle_timeout_in_minutes     = 0
    #   managed_outbound_ip_count   = 1
    #   managed_outbound_ipv6_count = 0
    #   outbound_ip_address_ids     = []
    #   outbound_ip_prefix_ids      = []
    #   outbound_ports_allocated    = 0
    # }
  }

  default_node_pool {
    name                  = var.default_node_pool_name
    os_sku                = var.default_node_pool_os_sku
    zones                 = var.default_node_pool_zones
    enable_auto_scaling   = var.default_node_pool_enable_auto_scaling
    scale_down_mode       = var.default_node_pool_scale_down_mode
    vm_size               = var.default_node_pool_vm_size
    min_count             = var.default_node_pool_min_count
    max_count             = var.default_node_pool_max_count
    enable_node_public_ip = var.default_node_pool_enable_node_public_ip
    max_pods              = var.default_node_pool_max_pods
    os_disk_size_gb       = var.default_node_pool_os_disk_size_gb
    os_disk_type          = var.default_node_pool_os_disk_type
    orchestrator_version  = var.default_node_pool_orchestrator_version

    node_labels = var.default_node_pool_node_labels
    vnet_subnet_id = var.vnet_subnet_id
    tags = var.default_node_pool_tags
    # node_taints = [
    #   "CriticalAddonsOnly=true:NoSchedule"
    # ]
  }

  workload_autoscaler_profile {
    keda_enabled                    = true
    vertical_pod_autoscaler_enabled = true
  }

  maintenance_window_auto_upgrade {
    day_of_month = 0
    day_of_week  = "Sunday"
    duration     = 4
    frequency    = "Weekly"
    interval     = 1
    start_date   = "2025-05-04T00:00:00Z"
    start_time   = "00:00"
    utc_offset   = "+00:00"
    week_index   = "First"
  }
  maintenance_window_node_os {
    day_of_month = 0
    day_of_week  = "Sunday"
    duration     = 4
    frequency    = "Weekly"
    interval     = 1
    start_date   = "2025-05-04T00:00:00Z"
    start_time   = "00:00"
    utc_offset   = "+00:00"
    week_index   = "First"
  }
}

resource "azurerm_kubernetes_cluster_node_pool" "userpool" {
  kubernetes_cluster_id = azurerm_kubernetes_cluster.zpayd-online.id
  name                  = var.userpool_name
  mode                  = var.userpool_mode
  os_sku                = var.userpool_os_sku
  os_type               = var.userpool_os_type
  zones                 = var.userpool_zones
  enable_auto_scaling   = var.userpool_enable_auto_scaling
  scale_down_mode       = var.userpool_scale_down_mode
  vm_size               = var.userpool_vm_size
  min_count             = var.userpool_min_count
  max_count             = var.userpool_max_count
  enable_node_public_ip = var.userpool_enable_node_public_ip
  max_pods              = var.userpool_max_pods
  os_disk_size_gb       = var.userpool_os_disk_size_gb
  os_disk_type          = var.userpool_os_disk_type
  vnet_subnet_id        = var.vnet_subnet_id
  orchestrator_version  = var.userpool_orchestrator_version

  node_labels = var.userpool_node_labels
  node_taints = var.userpool_node_taints

}