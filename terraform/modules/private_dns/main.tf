resource "azurerm_private_dns_zone" "this" {
  for_each            = var.dns_zone
  name                = each.value.dns_zone_name
  resource_group_name = each.value.rg_name
  tags                = each.value.tag
}

resource "azurerm_private_dns_zone_virtual_network_link" "this" {
  for_each              = var.dns_vnet_link
  name                  = each.value.dns_vnet_link_name
  private_dns_zone_name = each.value.dns_zone_name
  virtual_network_id    = each.value.virtual_network_id
  resource_group_name   = each.value.rg_name
}
