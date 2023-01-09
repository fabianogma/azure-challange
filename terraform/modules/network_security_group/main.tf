resource "azurerm_network_security_group" "this" {
  for_each            = var.nsg
  name                = each.value.nsg_name
  location            = each.value.location
  resource_group_name = each.value.rg_name
  tags                = each.value.tag
}

resource "azurerm_network_security_rule" "this" {
  for_each                    = var.rule
  name                        = each.value.rule_name
  priority                    = each.value.priority
  direction                   = each.value.direction
  access                      = each.value.access
  protocol                    = each.value.protocol
  source_port_range           = each.value.source_port_range
  destination_port_range      = each.value.destination_port_range
  source_address_prefix       = each.value.source_address_prefix
  destination_address_prefix  = each.value.destination_address_prefix
  resource_group_name         = each.value.rg_name
  network_security_group_name = each.value.nsg_name
}

resource "azurerm_subnet_network_security_group_association" "this" {
  for_each                  = var.association
  subnet_id                 = each.value.subnet_id
  network_security_group_id = each.value.nsg_id
  depends_on = [
    azurerm_network_security_group.this
  ]
}
