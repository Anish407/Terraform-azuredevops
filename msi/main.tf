data "azurerm_resource_group" "example" {
  name = var.rg_name
}

resource "azurerm_user_assigned_identity" "example" {
  resource_group_name = data.azurerm_resource_group.example.name
  location            = data.azurerm_resource_group.example.location

  name = var.msi_name
}