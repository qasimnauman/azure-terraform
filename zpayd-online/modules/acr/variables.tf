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

variable "acr_name" {
  description = "The name of the Azure Container Registry."
  type        = string
}

variable "network_rule_bypass_option" {
  description = "This hanleds the bypass option for the network rule."
  type        = string
}

variable "public_network_access_enabled" {
  description = "This handles the network rule set."
  type        = bool
}

variable "quarantine_policy_enabled" {
  description = "This handles the quarantine policy."
  type        = bool
}

variable "acr_sku" {
  description = "This holds the value for ACR SKU"
  type        = string
}


variable "acr_admin_enabled" {
  description = "Either the admin is enabled or not"
  type        = bool
}

variable "anonymous_pull_enabled" {
  description = "Is Anonymous Pull Enabled for ACR"
  type        = bool
}

variable "data_endpoint_enabled" {
  description = "Is Data Point Enabled in ACR"
  type        = bool
}

variable "export_policy_enabled" {
  description = "Is Export Policy Enabled or not in ACR"
  type = bool
}

variable "zone_redundancy_enabled" {
  description = "Is Zone Redundance Enabled or not in ACR"
  type = bool
}

variable "tags" {
  description = "Tags for ACR"
  type        = map(string)
}