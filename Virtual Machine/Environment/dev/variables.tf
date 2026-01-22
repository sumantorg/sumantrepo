module "rg" {
  source                = "../../modules/azurerm_resource_group"
  rg_config = var.rg_config
}

module "vnet" {
  source                 = "../../modules/azurerm_virtual_network"
  vnet_config = var.vnet_config
  depends_on             = [module.rg]
}

module "subnet" {
  source                  = "../../modules/azurerm_subnet"
  subnet_config = var.subnet_config
  depends_on              = [module.vnet]
}

module "pip" {
  source = "../../modules/azurerm_public_ip"
  ip_config = var.ip_config
  depends_on = [module.rg]
}

module "nic" {
  source = "../../modules/azurerm_nic"
  nic_config = var.nic_config
  depends_on = [module.subnet, module.pip]
}

module "nsg" {
  source = "../../modules/azurerm_network_security_group"
  nsg_config = var.nsg_config
  depends_on = [module.rg]
}

module "nsg_association" {
  source = "../../modules/azurerm_network_security_group_association"
  nsg_nic_config = var.nsg_nic_config
  depends_on = [module.nic, module.nsg]
}

module "vm" {
  source = "../../modules/azurerm_virtual_machine"
  vm_config = var.vm_config
  depends_on = [module.nic]
}




