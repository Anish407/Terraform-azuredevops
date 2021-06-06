data "azurerm_client_config" "current" {
  
}

data "azurerm_resource_group" "rg" {
  name = var.appservice_rg
}

resource "azurerm_application_insights" "appinsights" {
  name = var.app_insights_name
  resource_group_name = data.azurerm_resource_group.rg.id
  location = data.azurerm_resource_group.rg.location
  application_type = "web"
}

resource "azurerm_app_service_plan" "sample" {
  name                = var.app_service_planname
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "sample" {
  name                = var.appservice_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.sample.id

  site_config {
    dotnet_framework_version = "v5.0"
    linuxlinux_fx_version =  "DOTNETCORE|5.0"
  }

  identity {
    type="UserAssigned"
    identity_ids = var.msi_id
  }

  app_settings = {
    "SOME_KEY" = "some-value"
    "APPINSIGHTS_INSTRUMENTATIONKEY"=azurerm_application_insights.appinsights.instrumentation_key
  }

  connection_string {
    name  = "Database"
    type  = "SQLServer"
    value = "Server=some-server.mydomain.com;Integrated Security=SSPI"
  }
}