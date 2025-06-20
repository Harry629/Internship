resource "azurerm_windows_web_app" "this" {
  name                = var.name
  resource_group_name = var.rg_name
  location            = var.location
  service_plan_id     = var.service_plan_id
  tags                = var.tags

  site_config {
    dynamic "ip_restriction" {
      for_each = var.ip_restrictions
      content {
        name        = ip_restriction.value.name
        priority    = ip_restriction.value.priority
        action      = ip_restriction.value.action
        ip_address  = try(ip_restriction.value.ip_address, null)
        service_tag = try(ip_restriction.value.service_tag, null)
      }
    }

    # Optionally configure default action if supported
    ip_restriction_default_action = "Deny"
  }



  # Optional: app_settings, connection_strings, etc.
}