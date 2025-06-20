# creates an Azure Container Registry to store Docker images
resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = var.acr_rg
  location            = var.acr_location
  sku                 = var.acr_sku
  admin_enabled       = true

  tags = var.tags
}