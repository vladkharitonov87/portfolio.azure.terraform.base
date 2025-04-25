output "resource_group_name" {
  value = data.azurerm_resource_group.rg.name
}

output "azurerm_key_vault_name" {
  value = azurerm_key_vault.vault.name
}

output "azurerm_key_vault_id" {
  value = azurerm_key_vault.vault.id
}

output "azure_client_id" {
  value       = azuread_application.portfolio_api.client_id
}

output "azure_client_secret" {
  value       = azuread_service_principal_password.portfolio_api.value
  sensitive   = true
}