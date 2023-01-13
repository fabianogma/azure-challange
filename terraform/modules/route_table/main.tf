resource "azurerm_route_table" "this" {
  for_each                      = var.rt
  name                          = each.value.rt_name
  location                      = each.value.location
  resource_group_name           = each.value.rg_name
  disable_bgp_route_propagation = each.value.bgp

  route {
    name           = each.value.route_name
    address_prefix = each.value.address_prefix
    next_hop_type  = each.value.next_hop
  }

  tags = each.value.tag
}
