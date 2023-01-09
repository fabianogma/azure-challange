resource "azurerm_public_ip" "this" {
  name                = var.pip_name
  location            = var.location
  resource_group_name = var.rg_name
  tags                = var.tag
  allocation_method   = var.all_method
  sku                 = var.pip_sku
}

resource "azurerm_lb" "this" {
  name                = var.lb_name
  sku                 = var.sku
  sku_tier            = var.sku_tier
  location            = var.location
  resource_group_name = var.rg_name
  tags                = var.tag

  frontend_ip_configuration {
    name                 = azurerm_public_ip.this.name
    public_ip_address_id = azurerm_public_ip.this.id
  }
}

resource "azurerm_lb_backend_address_pool" "this" {
  loadbalancer_id = azurerm_lb.this.id
  name            = var.be_pool_name
}

resource "azurerm_lb_probe" "this" {
  loadbalancer_id = azurerm_lb.this.id
  name            = var.probe_name
  port            = var.port
  protocol        = var.probe_protocol
  request_path    = var.path
}

resource "azurerm_lb_rule" "this" {
  loadbalancer_id                = azurerm_lb.this.id
  name                           = var.lb_rule_name
  protocol                       = var.protocol
  frontend_port                  = var.fe_port
  backend_port                   = var.be_port
  frontend_ip_configuration_name = azurerm_public_ip.this.name
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.this.id]
  probe_id                       = azurerm_lb_probe.this.id
}
