resource "azurerm_virtual_network" "this" {
  for_each            = var.vnet
  name                = each.value.vnet_name
  location            = each.value.location
  resource_group_name = each.value.rg_name
  address_space       = each.value.address_space
  tags                = each.value.tag
}

resource "azurerm_subnet" "this" {
  for_each             = var.snet
  name                 = each.value.name
  resource_group_name  = each.value.rg_name
  virtual_network_name = each.value.vnet_name
  address_prefixes     = each.value.address_prefixes
  service_endpoints    = lookup(each.value, "service_endpoint", null)

  dynamic "delegation" {
    for_each = lookup(each.value, "delegation", {}) != {} ? [1] : []
    content {
      name = lookup(each.value.delegation, "delegation_name", null)
      service_delegation {
        name    = lookup(each.value.delegation.service_delegation, "service_delegation_name", null)
        actions = lookup(each.value.delegation.service_delegation, "actions", null)
      }
    }
  }
}
