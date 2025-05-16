# output "acrID" {
#     value = azurerm_container_registry.acr.id
# }

# output "acrLoginServer" {
#     value = azurerm_container_registry.acr.login_server
# }

output "acradmin" {
    value = azurerm_container_registry.zpaydonlinecr.admin_username
}

output "acrpassword" {
    value = azurerm_container_registry.zpaydonlinecr.admin_password
}

output "id" {
  value = azurerm_container_registry.zpaydonlinecr.id
}

output "acr_server" {
  value = azurerm_container_registry.zpaydonlinecr.login_server
}
