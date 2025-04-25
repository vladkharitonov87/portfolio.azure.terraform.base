resource "azurerm_key_vault_secret" "storage_key" {
  name         = "${var.secret_name}"
  value        = ""
  key_vault_id = azurerm_key_vault.vault.id
  tags         = local.tags

  depends_on = [azurerm_key_vault_access_policy.vkh_team, azurerm_key_vault_access_policy.portfolio_api_application_policy]
}