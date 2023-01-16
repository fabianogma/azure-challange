module "resource_group" {
  source = "../modules/resource_group"
  rg = {
    hub = {
      name     = "rg-shared-services-hub-eastus"
      location = "eastus"
      tag = {
        "Criado por"     = "Fabiano Silva"
        "Gerenciado por" = "Terraform"
        "Desafio"        = "Rosthan-Azure-Challange"
      }
    }
    public = {
      name     = "rg-public-spoke-eastus"
      location = "eastus"
      tag = {
        "Criado por"     = "Fabiano Silva"
        "Gerenciado por" = "Terraform"
        "Desafio"        = "Rosthan-Azure-Challange"
      }
    }
    private = {
      name     = "rg-private-spoke-eastus"
      location = "eastus"
      tag = {
        "Criado por"     = "Fabiano Silva"
        "Gerenciado por" = "Terraform"
        "Desafio"        = "Rosthan-Azure-Challange"
      }
    }
    database = {
      name     = "rg-database-spoke-eastus"
      location = "eastus"
      tag = {
        "Criado por"     = "Fabiano Silva"
        "Gerenciado por" = "Terraform"
        "Desafio"        = "Rosthan-Azure-Challange"
      }
    }
    streaming = {
      name     = "rg-streaming-spoke-eastus"
      location = "eastus"
      tag = {
        "Criado por"     = "Fabiano Silva"
        "Gerenciado por" = "Terraform"
        "Desafio"        = "Rosthan-Azure-Challange"
      }
    }
  }
}

module "vnet" {
  source = "../modules/virtual_network"
  vnet = {
    hub = {
      vnet_name     = "vnet-hub-eastus"
      address_space = ["10.1.0.0/16"]
      rg_name       = module.resource_group.rg_info.hub.name
      location      = module.resource_group.rg_info.hub.location
      tag           = module.resource_group.rg_info.hub.tags
    }
  }

  snet = {
    MngmtSubnet = {
      name             = "MngmtSubnet"
      address_prefixes = ["10.1.1.0/24"]
      rg_name          = module.resource_group.rg_info.hub.name
      vnet_name        = module.vnet.vnet_info.vnet1.name
    }
    SharedSubnet = {
      name             = "SharedSubnet"
      address_prefixes = ["10.1.2.0/24"]
      rg_name          = module.resource_group.rg_info.hub.name
      vnet_name        = module.vnet.vnet_info.vnet1.name
    }
    InboundSubnet = {
      name             = "InboundSubnet"
      address_prefixes = ["10.1.3.0/24"]
      rg_name          = module.resource_group.rg_info.hub.name
      vnet_name        = module.vnet.vnet_info.vnet1.name
    }
  }
}