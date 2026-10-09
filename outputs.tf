output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "storage_account_name" {
  value = azurerm_storage_account.site.name
}

output "site_url" {
  description = "Primary static website endpoint. Open this in a browser to validate the lab."
  value       = azurerm_storage_account.site.primary_web_endpoint
}
