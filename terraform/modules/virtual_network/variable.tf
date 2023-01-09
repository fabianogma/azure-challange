variable "vnet" {
  type = map(object({
    rg_name       = string
    location      = string
    tag           = map(any)
    vnet_name     = string
    address_space = list(any)
  }))
  description = "variavis para criacao de vnets"
}

variable "snet" {
  description = "criacao da subnet"
  type        = any
}
