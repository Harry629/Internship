output "web_app_name" {
  description = "Name of the Windows Web App"
  value       = azurerm_windows_web_app.this.name
}

output "web_app_default_hostname" {
  description = "Default hostname of the Windows Web App"
  value       = azurerm_windows_web_app.this
}

output "id" {
  value = azurerm_windows_web_app.this.id
}

output "location" {
  value = azurerm_windows_web_app.this.location
}