output "appservice_msi_id" {
    value = azurerm_app_service.sample.identity.id
}