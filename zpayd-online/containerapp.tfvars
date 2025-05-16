# Basic Info
# name                    = terraform.workspace == "production" ? "zpayd-online" : "zpayd-online-${terraform.workspace}"
revision_mode           = "Single"
max_inactive_revisions  = 5

# Tags
containerapp_tags = {
  environment = terraform.workspace == "production" ? "prod" : terraform.workspace
  name         = "zpayd"
  createdby    = "qasim"
}

# Workload Profile
workload_profile_name = "Consumption"

# Container App Environment ID
container_app_environment_id = "/subscriptions/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/resourceGroups/zpayd-online-resource/providers/Microsoft.App/managedEnvironments/zpayd-app-env"

# Ingress
ingress_allow_insecure_connections = false
ingress_exposed_port               = 0
ingress_external_enabled           = true
ingress_target_port                = 80
ingress_transport                  = "auto"
ingress_traffic_weight_label           = "stable"
ingress_traffic_weight_latest_revision = true
ingress_traffic_weight_percentage      = 100
ingress_traffic_weight_revision_suffix = "v1"

# Registry
registry_identity             = ""
registry_server               = "zpaydonlinecr.azurecr.io"
registry_username             = ""
registry_password_secret_name = ""

# Template
template_max_replicas                     = 100
template_min_replicas                     = 2
template_revision_suffix                  = "v1"
template_termination_grace_period_seconds = 30

# Container Config
template_container_name   = "zpayd-online-ca"
template_container_image  = "zpaydonlinecr.azurecr.io/zpayd-online:b7f54eec3a4741c7815befe6cfde91340a06e557"
template_container_cpu    = 2
template_container_memory = "4Gi"
template_container_args   = []
template_container_command = []

# HTTP Scale Rule
template_http_scale_rule_name                = "http-scaler"
template_http_scale_rule_concurrent_requests = 10
