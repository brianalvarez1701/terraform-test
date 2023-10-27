terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rgtestname" {
  name     = var.resource_group_name
  location = var.location
}

resource  "azuread_application"  "app" {
    display_name  =  "GitHub Actions"
}
 
resource  "azuread_service_principal"  "app" {
    application_id  =  azuread_application.app.client_id
}

resource  "azuread_application_password"  "example" {
    application_object_id  =  azuread_application.app.object_id
}

# Output the Service Principal and password
output  "app" {
    value  =  azuread_application.app.id
    sensitive  =  true
}

output  "app_password" {
    value  =  azuread_application_password.example.value
    sensitive  =  true
}