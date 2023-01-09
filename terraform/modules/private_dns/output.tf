output "dns_name" {
  value = tomap(azurerm_private_dns_zone.this)
}