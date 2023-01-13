variable "rt" {
  type = map(object({
    rt_name        = string
    location       = string
    rg_name        = string
    tag            = map(any)
    bgp            = string
    route_name     = string
    address_prefix = string
    next_hop       = string
  }))
  description = "Route table"
}
