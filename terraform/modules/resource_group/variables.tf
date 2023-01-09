variable "rg" {
  type = map(object({
    name     = string
    location = string
    tag      = map(any)
  }))
  description = "variavis para criacao de resource groups"
}
