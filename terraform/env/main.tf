module "resource_group" {
  source = "../modules/resource_group"
  rg = {
    rg1 = {
      name     = "rg_refactor_network"
      location = "eastus"
      tag = {
        "Criado por"     = "fabiano Silva"
        "Gerenciado por" = "Terraform"
        "Desafio"        = "101-Terraform-For-Cloud-Services"
      }
    }
  }
}

module "vnet" {
  source = "../modules/virtual_network"
  vnet = {
    vnet1 = {
      vnet_name     = "vnet-refactor"
      address_space = ["10.1.0.0/16"]
      rg_name       = module.resource_group.rg_info.rg1.name
      location      = module.resource_group.rg_info.rg1.location
      tag           = module.resource_group.rg_info.rg1.tags
    }
  }

  snet = {
    snet1 = {
      name             = "managementsubnet"
      address_prefixes = ["10.1.1.0/27"]
      rg_name          = module.resource_group.rg_info.rg1.name
      vnet_name        = module.vnet.vnet_info.vnet1.name
    }
    snet2 = {
      name             = "frontendsubnet"
      address_prefixes = ["10.1.2.0/27"]
      rg_name          = module.resource_group.rg_info.rg1.name
      vnet_name        = module.vnet.vnet_info.vnet1.name
    }
    snet3 = {
      name             = "databasesubnet"
      address_prefixes = ["10.1.3.0/26"]
      rg_name          = module.resource_group.rg_info.rg1.name
      vnet_name        = module.vnet.vnet_info.vnet1.name
      service_endpoint = ["Microsoft.Storage"]
      delegation = {
        delegation_name = "flexible-server"
        service_delegation = {
          service_delegation_name = "Microsoft.DBforMySQL/flexibleServers"
          actions                 = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
        }
      }
    }
  }
}