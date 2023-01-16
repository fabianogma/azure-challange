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
    public = {
      vnet_name     = "vnet-public-spoke-eastus"
      address_space = ["10.2.0.0/16"]
      rg_name       = module.resource_group.rg_info.public.name
      location      = module.resource_group.rg_info.public.location
      tag           = module.resource_group.rg_info.public.tags
    }
    private = {
      vnet_name     = "vnet-private-spoke-eastus"
      address_space = ["10.3.0.0/16"]
      rg_name       = module.resource_group.rg_info.private.name
      location      = module.resource_group.rg_info.private.location
      tag           = module.resource_group.rg_info.private.tags
    }
    database = {
      vnet_name     = "vnet-database-spoke-eastus"
      address_space = ["10.4.0.0/16"]
      rg_name       = module.resource_group.rg_info.database.name
      location      = module.resource_group.rg_info.database.location
      tag           = module.resource_group.rg_info.database.tags
    }
    streaming = {
      vnet_name     = "vnet-streaming-spoke-eastus"
      address_space = ["10.5.0.0/16"]
      rg_name       = module.resource_group.rg_info.streaming.name
      location      = module.resource_group.rg_info.streaming.location
      tag           = module.resource_group.rg_info.streaming.tags
    }
  }

  snet = {
    hub_MngmtSubnet = {
      name             = "MngmtSubnet"
      address_prefixes = ["10.1.1.0/24"]
      rg_name          = module.resource_group.rg_info.hub.name
      vnet_name        = module.vnet.vnet_info.hub.name
    }
    hub_SharedSubnet = {
      name             = "SharedSubnet"
      address_prefixes = ["10.1.2.0/24"]
      rg_name          = module.resource_group.rg_info.hub.name
      vnet_name        = module.vnet.vnet_info.hub.name
    }
    hub_InboundSubnet = {
      name             = "InboundSubnet"
      address_prefixes = ["10.1.3.0/24"]
      rg_name          = module.resource_group.rg_info.hub.name
      vnet_name        = module.vnet.vnet_info.hub.name
    }
  }
}