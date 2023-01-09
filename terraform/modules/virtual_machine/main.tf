resource "azurerm_public_ip" "this" {
  for_each            = var.pip
  name                = each.value.pip_name
  location            = each.value.location
  resource_group_name = each.value.rg_name
  tags                = each.value.tag
  allocation_method   = each.value.all_method
  sku                 = each.value.pip_sku
}

resource "azurerm_network_interface" "this" {
  for_each            = var.nic
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.rg_name
  tags                = each.value.tag

  ip_configuration {
    name                          = each.value.ip_conf_name
    subnet_id                     = each.value.subnet_id
    private_ip_address_allocation = each.value.allocation_type
    private_ip_address            = each.value.private_ip
    public_ip_address_id          = each.value.public_ip_id
  }
}

resource "azurerm_network_interface_backend_address_pool_association" "this" {
  for_each                = var.nic_be_association
  network_interface_id    = each.value.nic_id
  ip_configuration_name   = each.value.ip_conf_name
  backend_address_pool_id = each.value.backend_pool_id
  depends_on = [
    azurerm_network_interface.this
  ]
}

resource "azurerm_linux_virtual_machine" "this" {
  for_each                        = var.vm
  name                            = each.value.vm_name
  resource_group_name             = each.value.rg_name
  location                        = each.value.location
  tags                            = each.value.tag
  size                            = each.value.size
  admin_username                  = each.value.admin_user
  admin_password                  = each.value.admin_password
  disable_password_authentication = each.value.disable_pass_auth
  custom_data                     = each.value.custom_data
  network_interface_ids           = each.value.nic_id

  admin_ssh_key {
    username   = each.value.ssh_username
    public_key = each.value.public_key
  }

  os_disk {
    name                 = each.value.os_name
    caching              = each.value.os_disk_caching
    storage_account_type = each.value.os_disk_stg
  }

  source_image_reference {
    publisher = each.value.os_publisher
    offer     = each.value.os_offer
    sku       = each.value.os_sku
    version   = each.value.os_version
  }
}
