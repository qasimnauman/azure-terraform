resource "azurerm_container_app" "res-0" {
  name                          = var.name
  resource_group_name           = var.resource_group_name
  container_app_environment_id  = var.container_app_environment_id
  revision_mode                 = var.revision_mode
  workload_profile_name         = var.workload_profile_name
  # max_inactive_revisions        = var.max_inactive_revisions
  tags                          = var.containerapp_tags

  ingress {
    allow_insecure_connections = var.ingress_allow_insecure_connections
    # exposed_port               = var.ingress_exposed_port
    external_enabled           = var.ingress_external_enabled
    target_port                = var.ingress_target_port
    transport                  = var.ingress_transport

    traffic_weight {
      label           = var.ingress_traffic_weight_label
      latest_revision = true
      percentage      = var.ingress_traffic_weight_percentage
      # revision_suffix = var.ingress_traffic_weight_revision_suffix
    }
  }

  registry {
    # identity             = var.registry_identity
    # password_secret_name = var.registry_password_secret_name
    server               = var.registry_server
    username             = var.registry_username
  }

  template {
    max_replicas                     = var.template_max_replicas
    min_replicas                     = var.template_min_replicas
    revision_suffix                  = var.template_revision_suffix
    # termination_grace_period_seconds = var.template_termination_grace_period_seconds

    container {
      name    = var.template_container_name
      image   = var.template_container_image
      cpu     = var.template_container_cpu
      memory  = var.template_container_memory
      args    = var.template_container_args
      command = var.template_container_command
    }

    http_scale_rule {
      name                = var.template_http_scale_rule_name
      concurrent_requests = var.template_http_scale_rule_concurrent_requests
    }
  }
}
