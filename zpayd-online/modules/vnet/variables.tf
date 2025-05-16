variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The Azure region to deploy the resources."
  type        = string
}

variable "cluster_name" {
  description = "The name of the AKS cluster."
  type        = string

}