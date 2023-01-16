variable "peering" {
  description = "peering para as vnets"
  type = map(object({
    peering_name      = string
    rg_name           = string
    vnet_name         = string
    id                = string
    allow_vnet_access = bool
    allow_ft          = bool
    allow_gt          = bool
    use_rg            = bool
  }))
}
