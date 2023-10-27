resource "azurerm_service_plan" "splanname" {
  name                = "test-test-test"
  resource_group_name = azurerm_resource_group.rgtestname.name
  location            = azurerm_resource_group.rgtestname.location
  os_type             = "Windows"
  sku_name            = "P1v2"
}

resource "azurerm_windows_web_app" "appservicename" {
  name                = "test-test-test"
  location            = azurerm_resource_group.rgtestname.location
  resource_group_name = azurerm_resource_group.rgtestname.name
  service_plan_id      = azurerm_service_plan.splanname.id

  site_config {}
}