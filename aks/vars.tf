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

variable "cluster_name" {
  description = "The name of the AKS cluster."
  type        = string
  default     = "zpayd-online"
}

variable "acr_id" {
  description = "The ID of the Azure Container Registry."
  type        = string
  default     = "/subscriptions/08ac9f34-82f5-407c-9442-5f9351491b3d/resourceGroups/zpayd-online/providers/Microsoft.ContainerRegistry/registries/zpayd-online"
}

variable "subscription_id" {
  description = "The Azure subscription ID."
  type        = string
  default     = "08ac9f34-82f5-407c-9442-5f9351491b3d"
}