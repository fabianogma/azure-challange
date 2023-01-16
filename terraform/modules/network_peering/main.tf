resource "azurerm_virtual_network_peering" "this" {
  for_each                     = var.peering
  name                         = each.value.peering_name
  resource_group_name          = each.value.rg_name
  virtual_network_name         = each.value.vnet_name
  remote_virtual_network_id    = each.value.id
  allow_virtual_network_access = each.value.allow_vnet_access
  allow_forwarded_traffic      = each.value.allow_ft
  allow_gateway_transit        = each.value.allow_gt
  use_remote_gateways          = each.value.use_rg
}
