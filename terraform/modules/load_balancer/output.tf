output "lb_ip" {
  value = azurerm_public_ip.this.ip_address
}

output "backend_pool_id" {
  value = azurerm_lb_backend_address_pool.this.id
}