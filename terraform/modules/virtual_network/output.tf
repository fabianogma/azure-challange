output "subnet_id" {
  value = tomap(azurerm_subnet.this)
}

output "vnet_info" {
  value = tomap(azurerm_virtual_network.this)
}