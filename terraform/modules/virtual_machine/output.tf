output "nic_id" {
  value = tomap(azurerm_network_interface.this)
}

output "pip_id" {
  value = tomap(azurerm_public_ip.this)
}

output "vm-bastion-private-ip" {
  value = tomap(azurerm_network_interface.this)
}

output "ip_configuration_name" {
  value = tomap(azurerm_network_interface.this)
}