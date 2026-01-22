rg_details = {
  rg1 = {
    name     = "sumanrg"
    location = "westus"
  }
  # rg2 = {
  #   name     = "shiva58"
  #   location = "eastus"
  # }

}
# stor_details = {
#   stg1 = {
#     name                     = "loha59"
#     resource_group_name      = "shiva57"
#     location                 = "westus"
#     account_tier             = "Standard"
#     account_replication_type = "GRS"
#   }
#   stg2 = {
#     name                     = "loha58"
#     resource_group_name      = "shiva58"
#     location                 = "eastus"
#     account_tier             = "Standard"
#     account_replication_type = "LRS"
#   }
# }
vnet_details = {

  vnet1 = {
    name                = "suman-vnet6"
    location            = "westus"
    resource_group_name = "sumanrg"
    address_space       = ["10.128.0.0/16"]
    dns_servers         = ["10.0.0.4", "10.0.0.5"]
  }
  # vnet2 = {
  #   name                = "forntend-vnet7"
  #   location            = "eastus"
  #   resource_group_name = "shiva58"
  #   address_space       = ["10.129.0.0/16"]
  #   dns_servers         = ["10.0.0.6", "10.0.0.7"]
  # }

}
subnet_details = {
  sub1 = {

    name                 = "suman-subnet"
    resource_group_name  = "sumanrg"
    virtual_network_name = "suman-vnet6"
    address_prefixes     = ["10.128.0.0/24"]
  }
  # sub2 = {
  #   name                 = "sub-backend4"
  #   resource_group_name  = "shiva57"
  #   virtual_network_name = "forntend-vnet6"
  #   address_prefixes     = ["10.128.1.0/24"]
  # }
  sub3 = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "sumanrg"
    virtual_network_name = "suman-vnet6"
    address_prefixes     = ["10.128.2.0/24"]
  }
}
vms_details = {
  vm1 = {
    subnet_name          = "suman-subnet"
    virtual_network_name = "suman-vnet6"
    resource_group_name  = "sumanrg"
    nic_name             = "nic-1"
    vm_name              = "sumanvmiis"
    size                 = "Standard_F2"
    location             = "westus"
    kv_name              = "sumankv1"
  }
  # vm2 = {
  #   subnet_name          = "sub-backend4"
  #   virtual_network_name = "forntend-vnet6"
  #   resource_group_name  = "shiva57"
  #   nic_name             = "nic-2"
  #   vm_name              = "backendvm2"
  #   size                 = "Standard_F2"
  #   location             = "westus"
  #   kv_name              = "shiv2345g3"

  # }
}

kvs_details = {
  kv1 = {
    kv_name             = "sumankv1"
    location            = "westus"
    resource_group_name = "sumanrg"
  }
}

pip_details = {
  pip1 = {
    pip_name            = "pip-1"
    location            = "westus"
    resource_group_name = "sumanrg"

  }
  # pip2 = {
  #   pip_name            = "pip-2"
  #   location            = "westus"
  #   resource_group_name = "shiva57"

  # }
}
bas_details = {
  bas1 = {
    name                 = "sumanbas"
    location             = "westus"
    resource_group_name  = "sumanrg"
    virtual_network_name = "suman-vnet6"
    pip_name             = "pip-1"
  }
}



