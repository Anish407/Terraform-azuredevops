data "azurerm_client_config" "current" {
  
}


resource "azurerm_key_vault_access_policy" "example" {
  key_vault_id = var.keyvault_id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = var.msi_id

  secret_permissions = var.secret_permissions
}