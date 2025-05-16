resource "azurerm_container_registry" "zpaydonlinecr" {
  admin_enabled                 = var.acr_admin_enabled
  anonymous_pull_enabled        = var.anonymous_pull_enabled
  data_endpoint_enabled         = var.data_endpoint_enabled
  encryption                    = []
  export_policy_enabled         = var.export_policy_enabled
  location                      = var.location
  name                          = var.acr_name
  network_rule_bypass_option    = var.network_rule_bypass_option
  network_rule_set              = []
  public_network_access_enabled = var.public_network_access_enabled
  quarantine_policy_enabled     = var.quarantine_policy_enabled
  resource_group_name           = var.resource_group_name
  sku = var.acr_sku
  tags = var.tags
  zone_redundancy_enabled = var.zone_redundancy_enabled
}