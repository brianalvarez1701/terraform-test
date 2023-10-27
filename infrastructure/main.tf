resource "azurerm_service_plan" "splanname" {
  name                = "test-test-test"
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type             = "Windows"
  sku_name            = "P1v2"
}

resource "azurerm_windows_web_app" "appservicename" {
  name                = "test-test-test"
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = azurerm_service_plan.splanname.id

  site_config {}
}
