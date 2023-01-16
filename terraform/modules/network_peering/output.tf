output "peering_id" {
  value = tomap(azurerm_network_security_group.this)
}