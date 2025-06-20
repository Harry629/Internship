output "traffic_manager_fqdn" {
  description = "The FQDN of the Traffic Manager profile"
  value       = azurerm_traffic_manager_profile.this.fqdn
}

output "fqdn" {
  description = "Traffic Manager DNS name"
  value       = azurerm_traffic_manager_profile.this.fqdn
}