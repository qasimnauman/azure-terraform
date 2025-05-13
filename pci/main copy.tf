# terraform {
#   required_providers {
#     azurerm = {
#       source = "hashicorp/azurerm"
#     }
#     azuread = {
#       source = "hashicorp/azuread"
#     }
#     kubernetes = {
#       source = "hashicorp/kubernetes"
#     }
#   }
# }

# locals {
#   subscriptions = {
#     for sub in var.subscription : sub.name => {
#       subscription_id = sub.subscription_id
#       resource_group  = sub.resource_group
#       aks_name        = sub.aks_name
#       acr_name        = sub.acr_name
#       user_object_ids = sub.user_object_ids
#     }
#   }
# }

# provider "azurerm" {
#   features {}
#   subscription_id = local.subscriptions["merchant"].subscription_id
# }

# provider "azuread" {}

# provider "kubernetes" {
#   host                   = data.azurerm_kubernetes_cluster.aks.kube_config[0].host
#   client_certificate     = base64decode(data.azurerm_kubernetes_cluster.aks.kube_config[0].client_certificate)
#   client_key             = base64decode(data.azurerm_kubernetes_cluster.aks.kube_config[0].client_key)
#   cluster_ca_certificate = base64decode(data.azurerm_kubernetes_cluster.aks.kube_config[0].cluster_ca_certificate)
# }

# # 1. Azure AD Group
# resource "azuread_group" "devops_group" {
#   display_name     = "DevOps-Engineers-PCI"
#   security_enabled = true
# }

# # 2. Add arslan-zpayd to group
# data "azuread_user" "arslan_zpayd" {
#   user_principal_name = "arslan-zpayd@gezimzpayd.onmicrosoft.com" # <-- replace with actual UPN
# }

# data "azuread_user" "qasim" {
#   user_principal_name = "qasim@gezimzpayd.onmicrosoft.com"
# }

# # resource "azuread_group_member" "arslan_member" {
# #   group_object_id  = azuread_group.devops_group.id
# #   member_object_id = data.azuread_user.arslan_zpayd.id
# # }

# resource "azuread_group_member" "arslan_member" {
#   group_object_id  = azuread_group.devops_group.id
#   member_object_id = "f5025280-72d3-46c5-8dc1-39485cd00355" # actual UUID of arslan-zpayd
# }

# resource "azuread_group_member" "qasim_member" {
#   group_object_id  = azuread_group.devops_group.id
#   member_object_id = data.azuread_user.qasim.id
# }

# # 3. AKS Cluster Reference
# data "azurerm_kubernetes_cluster" "aks" {
#   name                = "zpayd-online"
#   resource_group_name = "zpayd-online-resource"
# }

# # 4. ACR Reference
# data "azurerm_container_registry" "acr" {
#   name                = "zpaydonline"
#   resource_group_name = "zpayd-online-resource"
# }

# # 5. Assign Role to AKS (Cluster User Role)
# resource "azurerm_role_assignment" "aks_access" {
#   scope                = data.azurerm_kubernetes_cluster.aks.id
#   role_definition_name = "Azure Kubernetes Service Cluster User Role"
#   principal_id         = azuread_group.devops_group.id
# }

# # 6. Assign Role to ACR (AcrPush)
# resource "azurerm_role_assignment" "acr_push" {
#   scope                = data.azurerm_container_registry.acr.id
#   role_definition_name = "AcrPush"
#   principal_id         = azuread_group.devops_group.id
# }

# # 7. Kubernetes RBAC: ClusterRole
# resource "kubernetes_cluster_role" "devops_role" {
#   metadata {
#     name = "devops-cluster-operator"
#   }

#   rule {
#     api_groups = ["apps", "extensions"]
#     resources  = ["deployments", "replicasets", "statefulsets", "daemonsets"]
#     verbs      = ["get", "list", "watch", "update", "patch", "scale"]
#   }

#   rule {
#     api_groups = [""]
#     resources  = ["pods"]
#     verbs      = ["get", "list", "watch", "delete"]
#   }

#   rule {
#     api_groups = ["batch"]
#     resources  = ["jobs", "cronjobs"]
#     verbs      = ["get", "list", "watch", "create", "delete"]
#   }
# }

# # 8. Kubernetes RBAC: ClusterRoleBinding
# resource "kubernetes_cluster_role_binding" "devops_binding" {
#   metadata {
#     name = "devops-operator-binding"
#   }

#   role_ref {
#     kind      = "ClusterRole"
#     name      = kubernetes_cluster_role.devops_role.metadata[0].name
#     api_group = "rbac.authorization.k8s.io"
#   }

#   subject {
#     kind      = "Group"
#     name      = "DevOps-Engineers-PCI"
#     api_group = "rbac.authorization.k8s.io"
#   }
# }
