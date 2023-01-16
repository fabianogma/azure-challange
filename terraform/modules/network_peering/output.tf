output "peering_id" {
  value = tomap(azurerm_virtual_network_peering.this)
}