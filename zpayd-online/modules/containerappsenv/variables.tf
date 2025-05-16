variable "container_apps_env_name" {
    description = "The name of the container app environment."
    type        = string
    default     = "zpayd-online-ca-env"
}

variable "zone_redundancy_enabled" {
    description = "Enable zone redundancy for the container app environment."
    type        = bool
    default     = false
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
  default = "zpayd-online"
}

variable "location" {
  description = "The Azure region to deploy the resources."
  type        = string
  default     = "Canada Central"
}

variable "log_analytics_workspace_id" {
    description = "The ID of the Log Analytics workspace."
    type        = string
    # default     = "/subscriptions/08ac9f34-82f5-407c-9442-5f9351491b3d/resourceGroups/zpayd-online/providers/Microsoft.OperationalInsights/workspaces/zpayd-online-law"
}

variable "container_env_tags" {
    description = "Tags to be applied to the container app environment."
    type        = map(string)
    default     = {
        CreatedBy = "qasim"
        Name      = "zpayd-online-ca-env"
    }
}

# variable "infrastructure_subnet_id" {
#   description = "The subnet ID for the Container App Environment infrastructure."
#   type        = string
# }


variable "internal_load_balancer_enabled_aca_env" {
    description = "Enable internal load balancer for the container app environment."
    type        = bool
    default     = false
}

variable "mutual_tls_enabled" {
    description = "Enable mutual TLS for the container app environment."
    type        = bool
    default     = false
}