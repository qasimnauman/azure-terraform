# locals.tf or main.tf
locals {
  rg_name = terraform.workspace == "default" ? "zpaydonline" : "zpaydonline-${terraform.workspace}"
  rgtags = {
    Name = terraform.workspace == "default" ? "zpaydonline" : "zpaydonline-${terraform.workspace}"
    created_by  = "qasim"
  }

  workspace_name = terraform.workspace == "default" ? "zpaydonline-logs" : "zpaydonline-logs-${terraform.workspace}"

  cluster_name = terraform.workspace == "default" ? "zpaydonline" : "zpaydonline-${terraform.workspace}"

  akstags = {
    Name = terraform.workspace == "default" ? "zpaydonline" : "zpaydonline-${terraform.workspace}"
    created_by  = "qasim"
  }

  default_node_pool_tags = {
    Name = terraform.workspace == "default" ? "zpaydonline" : "zpaydonline-${terraform.workspace}"
    created_by  = "qasim"
  }

  default_node_pool_node_labels = {
    Name = terraform.workspace == "default" ? "zpaydonline" : "zpaydonline-${terraform.workspace}"
    created_by  = "qasim"
  }

  userpool_tags = {
    Name = terraform.workspace == "default" ? "zpaydonline" : "zpaydonline-${terraform.workspace}"
    created_by  = "qasim"
  }

  userpool_node_labels = {
    Name = terraform.workspace == "default" ? "zpaydonline" : "zpaydonline-${terraform.workspace}"
    created_by  = "qasim"
  }

  # container_apps_env_name = terraform.workspace == "default" ? "zpaydonline" : "zpaydonline-${terraform.workspace}"

  container_env_tags = {
    Name = terraform.workspace == "default" ? "zpaydonline" : "zpaydonline-${terraform.workspace}"
    created_by  = "qasim"
  }

  ca_name = terraform.workspace == "default" ? "zpaydonline" : "zpaydonline-${terraform.workspace}"
  containerapp_tags = {
    Name = terraform.workspace == "default" ? "zpaydonline" : "zpaydonline-${terraform.workspace}"
    created_by  = "qasim"
  }
  # workload_profile_name = terraform.workspace == "default" ? "zpaydonline" : "zpaydonline-${terraform.workspace}"
  template_container_cpu = terraform.workspace == "default" ? 2 : 0.5
  template_container_memory = terraform.workspace == "default" ? 4 : 1.5
  template_container_name = terraform.workspace == "default" ? "zpaydonline" : "zpaydonline-${terraform.workspace}"

  sql_flexible_server_name = terraform.workspace == "default" ? "zpaydonline" : "zpaydonline-${terraform.workspace}"
  sql_tags = {
    Name = terraform.workspace == "default" ? "zpaydonline" : "zpaydonline-${terraform.workspace}"
    created_by  = "qasim"
  }
}