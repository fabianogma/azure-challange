// VARIAVEIS DO IP PUBLICO
variable "pip" {
  type = map(object({
    pip_name   = string
    location   = string
    rg_name    = string
    tag        = map(any)
    all_method = string
    pip_sku    = string
  }))
  description = "IP publico para as vms"
}

// VARIAVEIS DA NIC

variable "nic" {
  type = map(object({
    location        = string
    rg_name         = string
    tag             = map(any)
    nic_name        = string
    ip_conf_name    = string
    subnet_id       = any
    allocation_type = string
    private_ip      = string
    public_ip_id    = optional(string)
  }))
}

variable "nic_be_association" {
  type = map(object({
    nic_id          = string
    ip_conf_name    = string
    backend_pool_id = string
  }))
}

// VARIAVEIS DA VM

variable "vm" {
  type = map(object({
    location          = string
    rg_name           = string
    tag               = map(any)
    vm_name           = string
    size              = string
    nic_id            = any
    os_disk_caching   = string
    os_disk_stg       = string
    os_publisher      = string
    os_offer          = string
    os_sku            = string
    os_version        = string
    admin_user        = string
    ssh_username      = string
    public_key        = optional(any)
    admin_password    = optional(string)
    custom_data       = optional(any)
    disable_pass_auth = optional(bool)
    os_name           = optional(string)
  }))
}
