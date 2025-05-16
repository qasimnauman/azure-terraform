
variable "log_analytics_sku" {
  description = "The SKU of the Log Analytics workspace."
  type        = string
}

variable "retention_in_days" {
  description = "The number of days to retain data in the Log Analytics workspace."
  type        = number
}
