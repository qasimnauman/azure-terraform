terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
    azuread = {
      source = "hashicorp/azuread"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
  }
}

# 👤 User Details
data "azuread_user" "arslan_zpayd" {
  user_principal_name = "arslan-zpayd@gezimzpayd.onmicrosoft.com"
}

data "azuread_user" "arslan_online" {
  user_principal_name = "arslan-online@gezimzpayd.onmicrosoft.com"
}

data "azuread_user" "qasim" {
  user_principal_name = "qasim@gezimzpayd.onmicrosoft.com"
}

# 👥 Azure AD Group
resource "azuread_group" "devops_group" {
  display_name     = "DevOps-Engineers-PCI"
  security_enabled = true
}

# 👥 Group Membership
resource "azuread_group_member" "arslan_zpayd_member" {
  group_object_id  = azuread_group.devops_group.id
  member_object_id = data.azuread_user.arslan_zpayd.id
}

resource "azuread_group_member" "arslan_online_member" {
  group_object_id  = azuread_group.devops_group.id
  member_object_id = data.azuread_user.arslan_online.id
}

resource "azuread_group_member" "qasim_member" {
  group_object_id  = azuread_group.devops_group.id
  member_object_id = data.azuread_user.qasim.id
}

# 🧠 Locals for 2 Subscriptions
locals {
  subscriptions = {
    zpayd = {
      subscription_id = "SUBSCRIPTION_ID_1"
      resource_group  = "zpayd"
      aks_name        = "zpayd"
      acr_name        = "zpayd"
    }
    zpayd_online = {
      subscription_id = "SUBSCRIPTION_ID_2"
      resource_group  = "zpayd-online"
      aks_name        = "zpayd-online"
      acr_name        = "zpaydonlinecr"
    }
  }
}

# 🔧 Provider for zpayd
provider "azurerm" {
  alias           = "zpayd"
  features        {}
  subscription_id = local.subscriptions["zpayd"].subscription_id
}

# 🔧 Provider for zpayd-online
provider "azurerm" {
  alias           = "zpayd_online"
  features        {}
  subscription_id = local.subscriptions["zpayd_online"].subscription_id
}

provider "azuread" {}

# 🔐 AKS & ACR (zpayd)
data "azurerm_kubernetes_cluster" "zpayd_aks" {
  name                = local.subscriptions["zpayd"].aks_name
  resource_group_name = local.subscriptions["zpayd"].resource_group
  provider            = azurerm.zpayd
}

data "azurerm_container_registry" "zpayd_acr" {
  name                = local.subscriptions["zpayd"].acr_name
  resource_group_name = local.subscriptions["zpayd"].resource_group
  provider            = azurerm.zpayd
}

# 🔐 AKS & ACR (zpayd-online)
data "azurerm_kubernetes_cluster" "zpayd_online_aks" {
  name                = local.subscriptions["zpayd_online"].aks_name
  resource_group_name = local.subscriptions["zpayd_online"].resource_group
  provider            = azurerm.zpayd_online
}

data "azurerm_container_registry" "zpayd_online_acr" {
  name                = local.subscriptions["zpayd_online"].acr_name
  resource_group_name = local.subscriptions["zpayd_online"].resource_group
  provider            = azurerm.zpayd_online
}

# 🛡️ Role Assignments: AKS + ACR for both subs
resource "azurerm_role_assignment" "aks_access_zpayd" {
  scope                = data.azurerm_kubernetes_cluster.zpayd_aks.id
  role_definition_name = "Azure Kubernetes Service Cluster User Role"
  principal_id         = azuread_group.devops_group.id
  provider             = azurerm.zpayd
}

resource "azurerm_role_assignment" "acr_access_zpayd" {
  scope                = data.azurerm_container_registry.zpayd_acr.id
  role_definition_name = "AcrPush"
  principal_id         = azuread_group.devops_group.id
  provider             = azurerm.zpayd
}

resource "azurerm_role_assignment" "aks_access_zpayd_online" {
  scope                = data.azurerm_kubernetes_cluster.zpayd_online_aks.id
  role_definition_name = "Azure Kubernetes Service Cluster User Role"
  principal_id         = azuread_group.devops_group.id
  provider             = azurerm.zpayd_online
}

resource "azurerm_role_assignment" "acr_access_zpayd_online" {
  scope                = data.azurerm_container_registry.zpayd_online_acr.id
  role_definition_name = "AcrPush"
  principal_id         = azuread_group.devops_group.id
  provider             = azurerm.zpayd_online
}

# ⚙️ Kubernetes Provider (uses zpayd_online for kubectl access)
provider "kubernetes" {
  host                   = data.azurerm_kubernetes_cluster.zpayd_online_aks.kube_config[0].host
  client_certificate     = base64decode(data.azurerm_kubernetes_cluster.zpayd_online_aks.kube_config[0].client_certificate)
  client_key             = base64decode(data.azurerm_kubernetes_cluster.zpayd_online_aks.kube_config[0].client_key)
  cluster_ca_certificate = base64decode(data.azurerm_kubernetes_cluster.zpayd_online_aks.kube_config[0].cluster_ca_certificate)
}

# 🔐 Kubernetes RBAC
resource "kubernetes_cluster_role" "devops_role" {
  metadata {
    name = "devops-cluster-operator"
  }

  rule {
    api_groups = ["apps", "extensions"]
    resources  = ["deployments", "replicasets", "statefulsets", "daemonsets"]
    verbs      = ["get", "list", "watch", "update", "patch", "scale"]
  }

  rule {
    api_groups = [""]
    resources  = ["pods"]
    verbs      = ["get", "list", "watch", "delete"]
  }

  rule {
    api_groups = ["batch"]
    resources  = ["jobs", "cronjobs"]
    verbs      = ["get", "list", "watch", "create", "delete"]
  }
}

resource "kubernetes_cluster_role_binding" "devops_binding" {
  metadata {
    name = "devops-operator-binding"
  }

  role_ref {
    kind      = "ClusterRole"
    name      = kubernetes_cluster_role.devops_role.metadata[0].name
    api_group = "rbac.authorization.k8s.io"
  }

  subject {
    kind      = "Group"
    name      = "DevOps-Engineers-PCI"
    api_group = "rbac.authorization.k8s.io"
  }
}
