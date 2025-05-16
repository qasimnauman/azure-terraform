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

data "azuread_user" "praveen" {
  user_principal_name = "praveen@gezimzpayd.onmicrosoft.com"
}

data "azuread_user" "testuser" {
  user_principal_name = "testuser@gezimzpayd.onmicrosoft.com"
}

# 👥 Azure AD Group
resource "azuread_group" "devops_group" {
  display_name     = "DevOps"
  security_enabled = true
}

# 👥 Group Membership
resource "azuread_group_member" "arslan_zpayd_member" {
  group_object_id  = azuread_group.devops_group.object_id
  member_object_id = "f5025280-72d3-46c5-8dc1-39485cd00355"
  # member_object_id = data.azuread_user.arslan_zpayd.id
}

resource "azuread_group_member" "arslan_online_member" {
  group_object_id  = azuread_group.devops_group.object_id
  member_object_id = "f83780c0-b9dc-47fb-a03d-deb260c6a0af"
  # member_object_id = data.azuread_user.arslan_online.id
}

resource "azuread_group_member" "qasim_member" {
  group_object_id  = azuread_group.devops_group.object_id
  # member_object_id = data.azuread_user.qasim.id
  member_object_id = "1a27cff8-31af-46f8-a99a-9859b7be8ddf"
}

resource "azuread_group_member" "praveen_member" {
  group_object_id  = azuread_group.devops_group.object_id
  # member_object_id = data.azuread_user.qasim.id
  member_object_id = "cb06c2f3-f614-4a27-b57a-23d9cff78281"
}

resource "azuread_group_member" "testuser_member" {
  group_object_id  = azuread_group.devops_group.object_id
  # member_object_id = data.azuread_user.qasim.id
  member_object_id = "561162ae-f8a2-42ac-94c9-d1ac10786418"
}

# 🧠 Locals for 2 Subscriptions
locals {
  subscriptions = {
    zpayd = {
      subscription_id = "5423a55b-395b-48cb-989b-0ea2b1441ca7"
      resource_group  = "zpayd"
      aks_name        = "zpayd"
      acr_name        = "zpayd"
    }
    zpayd_online = {
      subscription_id = "08ac9f34-82f5-407c-9442-5f9351491b3d"
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
  principal_id         = azuread_group.devops_group.object_id
  provider             = azurerm.zpayd
}

resource "azurerm_role_assignment" "acr_access_zpayd" {
  scope                = data.azurerm_container_registry.zpayd_acr.id
  role_definition_name = "AcrPush"
  principal_id         = azuread_group.devops_group.object_id
  provider             = azurerm.zpayd
}

resource "azurerm_role_assignment" "aks_access_zpayd_online" {
  scope                = data.azurerm_kubernetes_cluster.zpayd_online_aks.id
  role_definition_name = "Azure Kubernetes Service Cluster User Role"
  principal_id         = azuread_group.devops_group.object_id
  provider             = azurerm.zpayd_online
}

resource "azurerm_role_assignment" "acr_access_zpayd_online" {
  scope                = data.azurerm_container_registry.zpayd_online_acr.id
  role_definition_name = "AcrPush"
  principal_id         = azuread_group.devops_group.object_id
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
resource "kubernetes_cluster_role" "devops" {
  metadata {
    name = "devops-aks-operator"
  }

  rule {
    api_groups = [""]
    resources  = ["pods"]
    verbs      = ["get", "list", "watch", "delete"]
  }

  rule {
    api_groups = [""]
    resources  = ["pods/exec", "pods/attach", "pods/portforward"]
    verbs      = [" "]
  }

  rule {
    api_groups = ["apps", "extensions"]
    resources  = ["deployments", "replicasets", "statefulsets", "daemonsets"]
    verbs      = ["get", "list", "watch", "update", "patch", "scale"]
  }

  rule {
    api_groups = ["batch"]
    resources  = ["jobs", "cronjobs"]
    verbs      = ["get", "list", "watch", "create", "delete"]
  }
}

resource "kubernetes_cluster_role_binding" "devops_binding" {
  metadata {
    name = "devops-binding"
  }

  role_ref {
    kind      = "ClusterRole"
    name      = kubernetes_cluster_role.devops.metadata[0].name
    api_group = "rbac.authorization.k8s.io"
  }

  subject {
    kind      = "Group"
    name      = "DevOps"
    api_group = "rbac.authorization.k8s.io"
  }
}

output "group_object_id" {
  value = azuread_group.devops_group.object_id
}

output "group_members" {
  value = azuread_group.devops_group.members
}