variable "dns_zone" {
  type = map(object({
    dns_zone_name = string
    rg_name       = string
    tag           = map(any)
  }))
}

variable "dns_vnet_link" {
  type = map(object({
    dns_vnet_link_name = string
    dns_zone_name      = string
    virtual_network_id = string
    rg_name            = string
  }))
}
