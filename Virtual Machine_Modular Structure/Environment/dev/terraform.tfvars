rg_config = {
  "dev-tas-rg" = {
    resource_group_name               = "dev-tas-rg"
    resource_group_location = "West US"
  }
  dev2-tas-rg = {
    resource_group_name               = "dev2-tas-rg"
    resource_group_location = "East US"
  }
}

vnet_config = {
  "dev-tas-vnet" = {
    virtual_network_name        = "dev-tas-vnet"
    address_space      = ["10.0.0.0/16"]
    resource_group_name = "dev-tas-rg"
    virtual_network_location           = "West US"
  }
}

subnet_config = {
  "dev-tas-subnet" = {
    subnet_name          = "dev-tas-subnet"
    resource_group_name  = "dev-tas-rg"
    virtual_network_name = "dev-tas-vnet"
    address_prefixes     = ["10.0.1.0/24"]
  }
}

ip_config = {
  "pip1" = {
    public_ip_name        = "pip1"
    resource_group_name   = "dev-tas-rg"
    resource_group_location             = "East US"
  }
}

nic_config = {
  "nic1" = {
    nic_name                    = "nic1"
    resource_group_name         = "dev-tas-rg"
    network_interface_location           = "East US"
    subnet_name                 = "dev-tas-subnet"
    virtual_network_name        = "dev-tas-vnet"
    public_ip_name              = "pip1"
  }
}

nsg_config = {
  "nsg1" = {
    nsg_name                = "nsg1"
    resource_group_name     = "dev-tas-rg"
    location                = "East US"
  }
}

nsg_nic_config = {
  "assoc1" = {
    nic_name                = "nic1"
    nsg_name                = "nsg1"
    resource_group_name     = "dev-tas-rg"
  }
}

vm_config = {
  "vm1" = {
    vm_name          = "vm1"
    resource_group_name = "dev-tas-rg"
    location        = "East US"
    nic_name        = "nic1"
    vm_size         = "Standard_B1s"
    admin_username  = "azureuser"
    admin_password  = "P@ssw0rd1234!"
    publisher       = "Canonical"
    offer           = "UbuntuServer"
    sku             = "18.04-LTS"
  }
}