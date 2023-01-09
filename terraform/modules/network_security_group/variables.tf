// VARIAVEIS NSG
variable "nsg" {
  type = map(object({
    nsg_name = string
    location = string
    rg_name  = string
    tag      = map(any)
  }))
  description = "criação da estrutura network security group"
}
variable "rule" {
  type = map(object({
    rule_name                  = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
    rg_name                    = string
    nsg_name                   = string
  }))

}

// NSG ASSOCIATION
variable "association" {
  type = map(object({
    subnet_id = any
    nsg_id    = any
  }))
  description = "associar a nsg a snet"
}
