output "rg_info" {
  value = tomap(azurerm_resource_group.this)
}