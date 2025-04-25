resource "azurerm_key_vault_access_policy" "vkh_team" {
  key_vault_id = azurerm_key_vault.vault.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = local.current_user_id
  secret_permissions = var.secret_permissions
  certificate_permissions = var.certificate_permissions
}

resource "azurerm_key_vault_access_policy" "portfolio_api_application_policy" {
  key_vault_id = azurerm_key_vault.vault.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = azuread_service_principal.portfolio_api.id
  secret_permissions = [
    "Get",
    "List",
  ]
  certificate_permissions = [
    "Get",
    "List",
  ]
}