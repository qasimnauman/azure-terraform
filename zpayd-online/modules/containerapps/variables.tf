variable "container_app_environment_id" {
  description = "The ID of the Container App Environment to which the Container App belongs."
  type        = string
}


variable "max_inactive_revisions" {
    description = "The maximum number of inactive revisions to keep for the Container App."
    type        = number
    default     = 100
}

variable "name" {
    description = "The name of the Container App."
    type        = string
}

variable "resource_group_name" {
    description = "The name of the resource group in which to create the Container App."
    type        = string
}

variable "revision_mode" {
    description = "The revision mode for the Container App. Can be 'Single' or 'Multiple'."
    type        = string
    default     = "Single"
}

variable "containerapp_tags" {
    description = "A map of tags to assign to the Container App."
    type        = map(string)
}

variable "workload_profile_name" {
    description = "The name of the workload profile for the Container App."
    type        = string
}

variable "ingress_allow_insecure_connections" {
    description = "Allow insecure connections to the Container App."
    type        = bool
    default     = false
}

# variable "ingress_exposed_port" {
#     description = "The port exposed by the Container App."
#     type        = number
#     default     = 0
# }

variable "ingress_external_enabled" {
    description = "Enable external access to the Container App."
    type        = bool
    default     = true
}

variable "ingress_target_port" {
    description = "The target port for the Container App."
    type        = number
    default     = 80
}

variable "ingress_transport" {
    description = "The transport protocol for the Container App ingress."
    type        = string
    default     = "auto"
}

variable "ingress_traffic_weight_latest_revision" {
    description = "The traffic weight for the latest revision of the Container App."
    type        = bool
    # default     = 100
}

variable "ingress_traffic_weight_revision_suffix" {
    description = "The revision suffix for the traffic weight."
    type        = string
    default     = ""
}

variable "ingress_traffic_weight_label" {
    description = "The label for the traffic weight."
    type        = string
    default     = ""
}

variable "ingress_traffic_weight_percentage" {
    description = "The percentage of traffic weight."
    type        = number
    default     = 100
}

variable "registry_identity" {
    description = "The identity for the Container App registry."
    type        = string
    default     = ""
}

variable "registry_password_secret_name" {
    description = "The name of the secret for the registry password."
    type        = string
    default     = ""
}

variable "registry_server" {
    description = "The server URL for the Container App registry."
    type        = string
    default     = ""
}

variable "registry_username" {
    description = "The username for the Container App registry."
    type        = string
    default     = ""
}

variable "template_max_replicas" {
    description = "The maximum number of replicas for the Container App."
    type        = number
    default     = 100
}

variable "template_min_replicas" {
    description = "The minimum number of replicas for the Container App."
    type        = number
    default     = 2
}

variable "template_revision_suffix" {
    description = "The revision suffix for the Container App."
    type        = string
    default     = ""
}

variable "template_termination_grace_period_seconds" {
    description = "The termination grace period in seconds for the Container App."
    type        = number
    default     = 30
}

variable "template_container_args" {
    description = "The arguments for the container in the Container App."
    type        = list(string)
    default     = []
}

variable "template_container_command" {
    description = "The command for the container in the Container App."
    type        = list(string)
    default     = []
}   

variable "template_container_cpu" {
    description = "The CPU allocation for the container in the Container App."
    type        = number
    default     = 2
}

variable "template_container_image" {
    description = "The image for the container in the Container App."
    type        = string
    default     = ""
}

variable "template_container_memory" {
    description = "The memory allocation for the container in the Container App."
    type        = string
    default     = "4Gi"
}

variable "template_container_name" {
    description = "The name of the container in the Container App."
    type        = string
    default     = ""
}

variable "template_http_scale_rule_concurrent_requests" {
    description = "The number of concurrent requests for the HTTP scale rule."
    type        = number
    default     = 10
}

variable "template_http_scale_rule_name" {
    description = "The name of the HTTP scale rule."
    type        = string
    default     = ""
}