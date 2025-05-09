resource "azurerm_kubernetes_cluster" "zpayd-online" {
  location                          = var.location
  resource_group_name               = var.resource_group_name
  name                              = var.cluster_name
  sku_tier                          = "Standard"
  local_account_disabled            = false
  dns_prefix                        = "${var.cluster_name}-dns"
  automatic_channel_upgrade         = "patch"
  node_os_channel_upgrade           = "NodeImage"
  azure_policy_enabled              = true
  workload_identity_enabled         = true
  image_cleaner_enabled             = true
  support_plan                      = "KubernetesOfficial"
  oidc_issuer_enabled               = true
  role_based_access_control_enabled = true
  private_cluster_enabled           = false

  oms_agent {
    log_analytics_workspace_id      = ""
    msi_auth_for_monitoring_enabled = true
  }

  web_app_routing {
    dns_zone_ids = []
  }

  windows_profile {
    admin_password = "" # Masked sensitive attribute
    admin_username = "azureuser"
    license        = ""
  }

  tags = {
    "CreatedBy" = "qasim"
    "Name"      = "${var.cluster_name}-aks"
  }

  key_vault_secrets_provider {
    secret_rotation_enabled  = false
    secret_rotation_interval = "2m"
  }

  identity {
    type = "SystemAssigned"
  }

  monitor_metrics {
    annotations_allowed = true
    labels_allowed      = true
  }


  network_profile {
    dns_service_ip      = "10.0.0.10"
    ip_versions         = ["IPv4"]
    load_balancer_sku   = "standard"
    network_data_plane  = "azure"
    network_mode        = ""
    network_plugin      = "azure"
    network_plugin_mode = "overlay"
    network_policy      = ""
    outbound_type       = "loadBalancer"
    pod_cidr            = "10.244.0.0/16"
    pod_cidrs           = ["10.244.0.0/16"]
    service_cidr        = "10.0.0.0/16"
    service_cidrs       = ["10.0.0.0/16"]
    load_balancer_profile {
      idle_timeout_in_minutes     = 0
      managed_outbound_ip_count   = 1
      managed_outbound_ipv6_count = 0
      outbound_ip_address_ids     = []
      outbound_ip_prefix_ids      = []
      outbound_ports_allocated    = 0
    }
  }

  default_node_pool {
    name                  = "System"
    os_sku                = "Ubuntu"
    zones                 = ["1", "2", "3"]
    enable_auto_scaling   = true
    scale_down_mode       = "Delete"
    vm_size               = "Standard_D4as_v5"
    min_count             = 1
    max_count             = 5
    enable_node_public_ip = false
    max_pods              = 55
    os_disk_size_gb       = 128
    os_disk_type          = "Managed"
    orchestrator_version = "1.31.7"

    node_labels = {
      "CreatedBy" = "qasim"
      "Name"      = "${var.cluster_name}-agent-np"
    }
    vnet_subnet_id = azurerm_subnet.default.id
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
    week_index   = ""
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
    week_index   = ""
  }
}


# resource "azurerm_kubernetes_cluster_node_pool" "agent_pool" {
#   kubernetes_cluster_id = azurerm_kubernetes_cluster.zpayd-online.id
#   name                  = "agentpool"
#   mode                  = "System"
#   os_sku                = "Ubuntu"
#   os_type               = "Linux"
#   zones                 = ["1", "2", "3"]
#   enable_auto_scaling   = true
#   scale_down_mode       = "Delete"
#   vm_size               = "Standard_D4as_v5"
#   min_count             = 2
#   max_count             = 5
#   enable_node_public_ip = false
#   max_pods              = 55
#   os_disk_size_gb       = 128
#   os_disk_type          = "Managed"

#   node_labels = {
#     "CreatedBy" = "qasim"
#     "Name"      = "${var.cluster_name}-agent-np"
#   }
#   node_taints = [
#     "CriticalAddonsOnly=true:NoSchedule"
#   ]
# }

resource "azurerm_kubernetes_cluster_node_pool" "userpool" {
  kubernetes_cluster_id = azurerm_kubernetes_cluster.zpayd-online.id
  name                  = "userpool"
  mode                  = "User"
  os_sku                = "Ubuntu"
  os_type               = "Linux"
  zones                 = ["1", "2", "3"]
  enable_auto_scaling   = true
  scale_down_mode       = "Delete"
  vm_size               = "Standard_D4as_v5"
  min_count             = 1
  max_count             = 5
  enable_node_public_ip = false
  max_pods              = 110
  os_disk_size_gb       = 128
  os_disk_type          = "Managed"
  vnet_subnet_id        = azurerm_subnet.default.id
  orchestrator_version = "1.31.7"

  node_labels = {
    "CreatedBy" = "qasim"
    "Name"      = "${var.cluster_name}-user-np"
  }
  node_taints = [
    "CriticalAddonsOnly=true:NoSchedule"
  ]

}

resource "azurerm_role_assignment" "acr_role_assignment" {
  depends_on                       = [azurerm_kubernetes_cluster.zpayd-online]
  principal_id                     = azurerm_kubernetes_cluster.zpayd-online.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = var.acr_id
  skip_service_principal_aad_check = true
}

resource "azurerm_log_analytics_workspace" "zpayd-online" {
  name                = "zpayd-online-log-analytics"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}
