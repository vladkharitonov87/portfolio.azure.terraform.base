data "azurerm_resource_group" "rg" {
  name = "vladislav-kharitonov"
}

data "azurerm_client_config" "current" {}

variable "resource_group_location" {
  type        = string
  description = "Location for all resources."
  default     = "West Europe"
}

variable "vault_name" {
  type        = string
  description = "The name of the key vault to be created. The value will be randomly generated if blank."
  default     = "portfolio"
}

variable "secret_name" {
  type        = string
  description = "The name of the key to be created. The value will be randomly generated if blank."
  default     = "AuthDBConnectionString"
}

variable "sku_name" {
  type        = string
  description = "The SKU of the vault to be created."
  default     = "standard"
  validation {
    condition     = contains(["standard", "premium"], var.sku_name)
    error_message = "The sku_name must be one of the following: standard, premium."
  }
}

variable "secret_permissions" {
  type        = list(string)
  description = "List of secret permissions."
  default     = ["List", "Get", "Set", "Delete", "Purge"]
}

variable "certificate_permissions" {
  type        = list(string)
  description = "List of secret permissions."
  default     = ["Get", "List", "Create", "Update", "Delete", "Import",]
}

variable "msi_id" {
  type        = string
  description = "The Managed Service Identity ID. If this value isn't null (the default), 'data.azurerm_client_config.current.object_id' will be set to this value."
  default     = null
}

variable "portfolio_api_application_display_name" {
  description = "A display name for the <portfolio_api_application>."
  type        = string
  default     = "portfolio_api"
}

locals {
  tags = {
    repo             = "portfolio"
    brand            = "llg"
    team             = "llg"
    env              = "dev"
    dataprivacylevel = "none"
    audience         = "internal"
  }

  brand_name = "llg"
  default_location_full_name    = "West Europe"
  default_location_abbreviation = "we"
  current_user_id = coalesce(var.msi_id, data.azurerm_client_config.current.object_id)
}
