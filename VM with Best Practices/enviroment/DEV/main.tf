module "rg_module" {
  source = "../../Module/resource_group"
  rg_map = var.rg_details
}

# module "stgs_module" {
#   source     = "../../Module/Storage_group"
#   stor_map   = var.stor_details
#   depends_on = [module.rg_module]

# }

module "vnet_module" {
  source     = "../../Module/Vnet"
  vnet_map   = var.vnet_details
  depends_on = [module.rg_module]
}
module "subnet_module" {
  source     = "../../Module/subnet"
  subnet_map = var.subnet_details
  depends_on = [module.vnet_module]
}
module "vm_module" {
  source     = "../../Module/Virtual_machine"
  vms        = var.vms_details
  depends_on = [module.rg_module, module.vnet_module, module.subnet_module, module.kv_module]
}
module "kv_module" {
  source     = "../../Module/keyvault"
  kv_map     = var.kvs_details
  depends_on = [module.rg_module]
}
module "pip_module" {
  source     = "../../Module/public_ip"
  pip_map    = var.pip_details
  depends_on = [module.rg_module]

}
module "bas_module" {
  source     = "../../Module/Bastons"
  bas_map    = var.bas_details
  depends_on = [module.subnet_module]
}