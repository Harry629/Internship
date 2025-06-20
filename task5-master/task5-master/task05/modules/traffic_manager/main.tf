resource "azurerm_traffic_manager_profile" "this" {
  name                   = var.profile_name
  resource_group_name    = var.traffic_manager_rg
  traffic_routing_method = var.routing_method
  tags                   = var.tags
  dns_config {
    relative_name = var.dns_name
    ttl           = 30
  }
  monitor_config {
    protocol = "HTTP"
    port     = 80
    path     = "/"
  }
}

resource "azurerm_traffic_manager_azure_endpoint" "this" {
  for_each = var.endpoints

  name               = each.value.name
  profile_id         = azurerm_traffic_manager_profile.this.id
  target_resource_id = each.value.target_resource_id
  weight             = 100
}