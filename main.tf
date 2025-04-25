resource "azuread_application" "portfolio_api" {
  display_name = var.portfolio_api_application_display_name
}

resource "azuread_service_principal" "portfolio_api" {
  client_id = azuread_application.portfolio_api.client_id
}

resource "azuread_service_principal_password" "portfolio_api" {
  service_principal_id = azuread_service_principal.portfolio_api.object_id
}

resource "azurerm_key_vault" "vault" {
  name                       = "${local.brand_name}-${var.vault_name}-${local.default_location_abbreviation}-kv"
  location                   = data.azurerm_resource_group.rg.location
  resource_group_name        = data.azurerm_resource_group.rg.name
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  sku_name                   = var.sku_name
  soft_delete_retention_days = 7
  purge_protection_enabled    = false
}