variable "ca_env_zone_redundancy_enabled" {
  description = "Enable zone redundancy for the container app environment."
  type        = bool
}

# variable "ca_env_infrastructure_subnet_id" {
#   description = "The subnet ID for the Container App Environment infrastructure."
#   type        = string
# }

variable "internal_load_balancer_enabled_aca_env" {
  description = "Enable internal load balancer for the container app environment."
  type        = bool
}

variable "mutual_tls_enabled" {
  description = "Enable mutual TLS for the container app environment."
  type        = bool
}
