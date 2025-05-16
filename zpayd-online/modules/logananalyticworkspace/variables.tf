variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The Azure region to deploy the resources."
  type        = string
}

variable "workspace_name" {
  description = "The name of the Log Analytics workspace."
  type        = string
  default     = "zpayd-online-log-analytics"
}

variable "sku" {
  description = "The SKU of the Log Analytics workspace."
  type        = string
  default     = "PerGB2018"
}

variable "retention_in_days" {
  description = "The number of days to retain data in the Log Analytics workspace."
  type        = number
  default     = 30
}