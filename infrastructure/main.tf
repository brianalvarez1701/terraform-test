resource "azurerm_resource_group" "rgtestname" {
  name     = var.resource_group_name
  location = var.location
}
