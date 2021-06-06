data "azurerm_client_config" "current" {
  
}

data "azurerm_resource_group" "rg" {
  name = var.keyvault_rg
}

resource "azurerm_key_vault" "example" {
  name                = var.kv_name
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = "standard"
}

