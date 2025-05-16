provider "azurerm" {
  features {}
  skip_provider_registration = true
  subscription_id = var.subscription_id
}

provider "vault" {
  address = "http://3.90.145.3:8200"
  skip_child_token = true

  auth_login {
    path = "auth/approle/login"

    parameters = {
      role_id = "c6cb8528-0cf6-d177-ea93-10ffda1766d4"
      secret_id = "5747b38b-ec1e-2c80-3252-19738bd30c11"
    }
  }
}