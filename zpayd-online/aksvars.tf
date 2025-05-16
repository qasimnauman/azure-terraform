# variable "resource_group_name" {
#   description = "The name of the resource group."
#   type        = string
# }

variable "aks_sku_tier" {
  description = "SKU Tier for AKS"
  type        = string
}

variable "aks_local_account_disabled" {
  description = "AKS Local Account Disabled ot Not"
  type=bool
}

variable "automatic_channel_upgrade" {
  description = "Automatic Channel Upgrade Mode"
  type = string
}

variable "node_os_channel_upgrade" {
  description = "Node OS Channel Upgrade Method"
  type = string
}

variable "aks_azure_policy_enabled" {
  description = "Azure Policy for AKS"
  type = bool
}

variable "aks_workload_identity_enabled" {
  description = "AKS Workload Identify Status"
  type = bool
}

variable "aks_image_cleaner_enabled" {
  description = "AKS Image Cleaner Enabled Status"
  type = bool
}

variable "aks_support_plan" {
  description = "AKS Support Plan"
  type = string
}

variable "aks_oidc_issuer_enabled" {
  description = "AKS OIDC Issuer Enabled Status"
  type = bool
}

variable "aks_role_based_access_control_enabled" {
  description = "AKS RBAC Control Enabled Status"
  type = bool
}

variable "aks_private_cluster_enabled" {
  description = "AKS Private Cluster Enabled"
  type = bool
}

variable "aks_oms_agent_msi_auth_for_monitoring_enabled" {
  description = "AKS OMS Agent Montitoring Enabled"
  type = bool
}

variable "aks_web_app_routing_dns_zone_ids" {
  description = "AKS Web App Routing DNS Zone IDs"
  type = list(string)
}


variable "key_vault_secrets_provider_secret_rotation" {
  description = "AKS Key Vault Secrets Provider Secret Rotation"
  type        = bool
}

variable "key_vault_secrets_provider_secret_rotation_interval" {
  description = "AKS Key Vault Secrets Provider Secret Rotation Interval"
  type        = string
}

variable "aks_identity_type" {
  description = "AKS Identity Type"
  type        = string
}

variable "monitor_metrics_annotations_allowed" {
  description = "AKS Monitor Metrics Annotations Allowed"
  type        = bool
}

variable "monitor_metrics_labels_allowed" {
  description = "AKS Monitor Metrics Labels Allowed"
  type        = bool
}

variable "network_profile_dns_service_ip" {
  description = "AKS Network Profile DNS Service IP"
  type        = string
}

variable "network_profile_ip_versions" {
  description = "AKS Network Profile IP Versions"
  type        = list(string)
}

variable "network_profile_load_balancer_sku" {
  description = "AKS Network Profile Load Balancer SKU"
  type        = string
}

variable "network_profile_network_data_plane" {
  description = "AKS Network Profile Network Data Plane"
  type        = string
}

variable "network_profile_network_plugin" {
  description = "AKS Network Profile Network Plugin"
  type        = string
}

variable "network_profile_network_plugin_mode" {
  description = "AKS Network Profile Network Plugin Mode"
  type        = string
}

variable "network_profile_outbound_type" {
  description = "AKS Network Profile Outbound Type"
  type        = string
}

variable "network_profile_pod_cidr" {
  description = "AKS Network Profile Pod CIDR"
  type        = string
}

variable "network_profile_pod_cidrs" {
  description = "AKS Network Profile Pod CIDRs"
  type        = list(string)
}

variable "network_profile_service_cidr" {
  description = "AKS Network Profile Service CIDR"
  type        = string
}

variable "network_profile_service_cidrs" {
  description = "AKS Network Profile Service CIDRs"
  type        = list(string)
}

# variable "network_profile_load_balancer_profile_managed_outbound_ip_count" {
#   description = "AKS Network Profile Load Balancer Profile Managed Outbound IP Count"
#   type        = number
# }

# variable "network_profile_load_balancer_profile_idle_timeout_in_minutes" {
#   description = "AKS Network Profile Load Balancer Profile Idle Timeout in Minutes"
#   type        = number
# }

# variable "network_profile_load_balancer_profile_managed_outbound_ipv6_count" {
#   description = "AKS Network Profile Load Balancer Profile Managed Outbound IPv6 Count"
#   type        = number
# }

# variable "network_profile_load_balancer_profile_outbound_ip_address_ids" {
#   description = "AKS Network Profile Load Balancer Profile Outbound IP Address IDs"
#   type        = list(string)
# }

# variable "network_profile_load_balancer_profile_outbound_ip_prefix_ids" {
#   description = "AKS Network Profile Load Balancer Profile Outbound IP Prefix IDs"
#   type        = list(string)
# }

# variable "network_profile_load_balancer_profile_outbound_ports_allocated" {
#   description = "AKS Network Profile Load Balancer Profile Outbound Ports Allocated"
#   type        = number
# }

variable "default_node_pool_name" {
  description = "AKS Default Node Pool Name"
  type        = string
}

variable "default_node_pool_os_sku" {
  description = "AKS Default Node Pool OS SKU"
  type        = string
}

variable "default_node_pool_zones" {
  description = "AKS Default Node Pool Zones"
  type        = list(string)
}

variable "default_node_pool_enable_auto_scaling" {
  description = "AKS Default Node Pool Enable Auto Scaling"
  type        = bool
}

variable "default_node_pool_scale_down_mode" {
  description = "AKS Default Node Pool Scale Down Mode"
  type        = string
}

variable "default_node_pool_vm_size" {
  description = "AKS Default Node Pool VM Size"
  type        = string
}

variable "default_node_pool_min_count" {
  description = "AKS Default Node Pool Minimum Count"
  type        = number
}

variable "default_node_pool_max_count" {
  description = "AKS Default Node Pool Maximum Count"
  type        = number
}

variable "default_node_pool_enable_node_public_ip" {
  description = "AKS Default Node Pool Enable Node Public IP"
  type        = bool
}

variable "default_node_pool_max_pods" {
  description = "AKS Default Node Pool Maximum Pods"
  type        = number
}

# variable "default_node_pool_tags" {
#   description = "AKS Default Node Pool Tags"
#   type        = map(string)
# }

variable "default_node_pool_os_disk_size_gb" {
  description = "AKS Default Node Pool OS Disk Size in GB"
  type        = number
}

variable "default_node_pool_os_disk_type" {
  description = "AKS Default Node Pool OS Disk Type"
  type        = string
}

variable "default_node_pool_orchestrator_version" {
  description = "AKS Default Node Pool Orchestrator Version"
  type = string
}

# variable "default_node_pool_node_labels" {
#   description = "AKS Default Node Pool Node Labels"
#   type        = map(string)
# }

variable "default_node_pool_node_taints" {
  description = "AKS Default Node Pool Node Taints"
  type        = list(string)
}

# variable "vnet_subnet_id" {
#   description = "AKS VNet Subnet ID"
#   type        = string
# }

variable "workload_autoscaler_profile_keda_enabled" {
  description = "AKS Workload Autoscaler Profile KEDA Enabled"
  type        = bool
}

variable "workload_autoscaler_profile_vertical_pod_autoscaler_enabled" {
  description = "AKS Workload Autoscaler Profile Vertical Pod Autoscaler Enabled"
  type        = bool
}

variable "userpool_name" {
  description = "AKS User Pool Name"
  type        = string
}

variable "userpool_mode" {
  description = "AKS User Pool Mode"
  type        = string
}

variable "userpool_vm_size" {
  description = "AKS User Pool VM Size"
  type        = string
}

variable "userpool_os_disk_size_gb" {
  description = "AKS User Pool OS Disk Size in GB"
  type        = number
}

variable "userpool_os_disk_type" {
  description = "AKS User Pool OS Disk Type"
  type        = string
}

variable "userpool_os_type" {
  description = "AKS User Pool OS Type"
  type        = string
}

variable "userpool_os_sku" {
  description = "AKS User Pool OS SKU"
  type        = string
}

variable "userpool_zones" {
  description = "AKS User Pool Zones"
  type        = list(string)
}

variable "userpool_enable_auto_scaling" {
  description = "AKS User Pool Enable Auto Scaling"
  type        = bool
}

variable "userpool_scale_down_mode" {
  description = "AKS User Pool Scale Down Mode"
  type        = string
}

variable "userpool_min_count" {
  description = "AKS User Pool Minimum Count"
  type        = number
}

variable "userpool_max_count" {
  description = "AKS User Pool Maximum Count"
  type        = number
}

variable "userpool_enable_node_public_ip" {
  description = "AKS User Pool Enable Node Public IP"
  type        = bool
}

variable "userpool_max_pods" {
  description = "AKS User Pool Maximum Pods"
  type        = number
}

# variable "userpool_vnet_subnet_id" {
#   description = "AKS User Pool VNet Subnet ID"
#   type        = string
# }

variable "userpool_orchestrator_version" {
  description = "AKS User Pool Orchestrator Version"
  type        = string
}

# variable "userpool_tags" {
#   description = "AKS User Pool Tags"
#   type        = map(string)
# }

# variable "userpool_node_labels" {
#   description = "AKS User Pool Node Labels"
#   type        = map(string)
# }

variable "userpool_node_taints" {
  description = "AKS User Pool Node Taints"
  type        = list(string)
}

# variable "log_analytics_workspace_id" {
#   description = "Log Analytics Workspace ID"
#   type        = string
# }

# variable "log_analytics_workspace_sku" {
#   description = "Log Analytics Workspace SKU"
#   type        = string
# }

# variable "log_analytics_workspace_retention_in_days" {
#   description = "Log Analytics Workspace Retention in Days"
#   type        = number
# }
