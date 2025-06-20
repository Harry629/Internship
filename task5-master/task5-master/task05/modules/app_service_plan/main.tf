# resource "azurerm_app_service_plan" "this" {
#   name                = var.name
#   location            = var.location
#   resource_group_name = var.resource_group_name

#   sku {
#     tier = var.sku_tier
#     size = var.sku_size
#     capacity = var.worker_count
#   }

#   tags         = var.tags
# }


resource "azurerm_service_plan" "this" {
  name                = var.name
  resource_group_name = var.rg_name
  location            = var.location

  sku_name     = var.sku_size # e.g., P0v3, P1v3
  worker_count = var.capacity

  os_type                = var.os_type # Windows or Linux
  zone_balancing_enabled = false       # Optional
  tags                   = var.tags
}