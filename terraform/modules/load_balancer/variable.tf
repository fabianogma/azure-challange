// VARIAVEL DO IP PUBLICO
variable "pip_name" {
  type        = string
  description = "nome do ip publico"
}
variable "all_method" {
  type        = string
  description = "modelo de IP, publico ou estatico"
}
variable "pip_sku" {
  type        = string
  description = "valores aceitos sao Basic, Standard e Gateway"
}

// LOAD BALANCER
variable "lb_name" {
  type        = string
  description = "nome do load balancer"
}
variable "sku" {
  type        = string
  description = "valores aceitos sao Basic, Standard e Gateway"
}
variable "sku_tier" {
  type        = string
  description = "valores aceitos sao Global and Regional"
}

// VARIAVEIS BACKEND POOL
variable "be_pool_name" {
  type = string
}

// PROBE
variable "probe_name" {
  type        = string
  description = "nome do probe do load balancer"
}
variable "port" {
  type        = number
  description = "porta do probe"
}
variable "path" {
  type        = string
  description = "caminho que sera avaliado pelo health probe"
}
variable "probe_protocol" {
  type        = string
  description = "valores podem ser HTTP, HTTPS u TCP"
}

// RULE
variable "lb_rule_name" {
  type        = string
  description = "nome do load balancer rule"
}
variable "protocol" {
  type        = string
  description = "protocolo da rule do lb"
}
variable "fe_port" {
  type        = number
  description = "porta do frontend"
}
variable "be_port" {
  type        = number
  description = "porta do backend"
}

// VARIAVEIS GLOBAIS
variable "location" {
  type        = string
  description = "regiao do recurso"
}
variable "rg_name" {
  type        = string
  description = "nome do resource group que o recurso sera instanciado"
}
variable "tag" {
  type        = map(any)
  description = "tags para o recurso"
}
