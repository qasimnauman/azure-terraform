variable "max_inactive_revisions" {
  description = "The maximum number of inactive revisions to keep for the Container App."
  type        = number
}

variable "revision_mode" {
  description = "The revision mode for the Container App. Can be 'Single' or 'Multiple'."
  type        = string
}

variable "ingress_allow_insecure_connections" {
  description = "Allow insecure connections to the Container App."
  type        = bool
}

variable "ingress_exposed_port" {
  description = "The port exposed by the Container App."
  type        = number
}

variable "ingress_external_enabled" {
  description = "Enable external access to the Container App."
  type        = bool
}

variable "ingress_target_port" {
  description = "The target port for the Container App."
  type        = number
}

variable "ingress_transport" {
  description = "The transport protocol for the Container App ingress."
  type        = string
}

variable "ingress_traffic_weight_latest_revision" {
  description = "The traffic weight for the latest revision of the Container App."
  type        = bool
}

variable "ingress_traffic_weight_revision_suffix" {
  description = "The revision suffix for the traffic weight."
  type        = string
}

variable "ingress_traffic_weight_label" {
  description = "The label for the traffic weight."
  type        = string
}

variable "ingress_traffic_weight_percentage" {
  description = "The percentage of traffic weight."
  type        = number
}

# variable "registry_identity" {
#   description = "The identity for the Container App registry."
#   type        = string
# }

# variable "registry_password_secret_name" {
#   description = "The name of the secret for the registry password."
#   type        = string
# }

variable "registry_server" {
  description = "The server URL for the Container App registry."
  type        = string
}

variable "registry_username" {
  description = "The username for the Container App registry."
  type        = string
}

variable "template_max_replicas" {
  description = "The maximum number of replicas for the Container App."
  type        = number
}

variable "template_min_replicas" {
  description = "The minimum number of replicas for the Container App."
  type        = number
}

variable "template_revision_suffix" {
  description = "The revision suffix for the Container App."
  type        = string
}

variable "template_termination_grace_period_seconds" {
  description = "The termination grace period in seconds for the Container App."
  type        = number
}

variable "template_container_args" {
  description = "The arguments for the container in the Container App."
  type        = list(string)
}

variable "template_container_command" {
  description = "The command for the container in the Container App."
  type        = list(string)
}

variable "template_container_image" {
  description = "The image for the container in the Container App."
  type        = string
}

variable "template_http_scale_rule_concurrent_requests" {
  description = "The number of concurrent requests for the HTTP scale rule."
  type        = number
}

variable "template_http_scale_rule_name" {
  description = "The name of the HTTP scale rule."
  type        = string
}

variable "workload_profile_name" {
  description = "The name of the workload profile for the Container App."
  type        = string
}