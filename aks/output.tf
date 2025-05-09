output "aks_id" {
  value = azurerm_kubernetes_cluster.zpayd-online.id
}

output "aks_current_kubernetes_version" {
  value = azurerm_kubernetes_cluster.zpayd-online.current_kubernetes_version
}

output "aks_fqdn" {
  value = azurerm_kubernetes_cluster.zpayd-online.fqdn
}

output "aks_private_fqdn" {
  value = azurerm_kubernetes_cluster.zpayd-online.private_fqdn
}

output "aks_portal_fqdn" {
  value = azurerm_kubernetes_cluster.zpayd-online.portal_fqdn
}

output "aks_kube_admin_config_raw" {
  value     = azurerm_kubernetes_cluster.zpayd-online.kube_admin_config_raw
  sensitive = true
}

output "aks_kube_config_raw" {
  value     = azurerm_kubernetes_cluster.zpayd-online.kube_config_raw
  sensitive = true
}

output "aks_http_application_routing_zone_name" {
  value = azurerm_kubernetes_cluster.zpayd-online.http_application_routing_zone_name
}

output "aks_oidc_issuer_url" {
  value = azurerm_kubernetes_cluster.zpayd-online.oidc_issuer_url
}

output "aks_node_resource_group" {
  value = azurerm_kubernetes_cluster.zpayd-online.node_resource_group
}

output "aks_node_resource_group_id" {
  value = azurerm_kubernetes_cluster.zpayd-online.node_resource_group_id
}

output "aks_network_profile" {
  value = azurerm_kubernetes_cluster.zpayd-online.network_profile
}

output "aks_ingress_application_gateway" {
  value = azurerm_kubernetes_cluster.zpayd-online.ingress_application_gateway
}

output "aks_oms_agent" {
  value = azurerm_kubernetes_cluster.zpayd-online.oms_agent
}

output "aks_key_vault_secrets_provider" {
  value = azurerm_kubernetes_cluster.zpayd-online.key_vault_secrets_provider
}

output "aks_kubelet_identity" {
  value = azurerm_kubernetes_cluster.zpayd-online.kubelet_identity[0]
}

output "aks_identity" {
  value = azurerm_kubernetes_cluster.zpayd-online.identity[0]
}

output "aks_web_app_routing" {
  value = azurerm_kubernetes_cluster.zpayd-online.web_app_routing
}
