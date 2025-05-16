variable "rg_name" {
  description = "The name of the resource group."
  type        = string
  default     = "zpayd-online"
}

variable "location" {
  description = "The Azure region to deploy the resources."
  type        = string
  default     = "Canada Central"
}

variable "tags" {
  description = "A map of tags to assign to the resource group."
  type        = map(string)
  default     = {
    environment = "dev"
    owner       = "zpayd"
  }
}