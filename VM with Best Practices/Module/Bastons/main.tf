resource "azurerm_bastion_host" "bas" {
    for_each = var.bas_map
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = data.azurerm_subnet.subnet[each.key].id
    public_ip_address_id = data.azurerm_public_ip.pipdata[each.key].id
  }
}

data "azurerm_subnet" "subnet" {
  for_each             = var.bas_map
  name                 = "AzureBastionSubnet"
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}
data "azurerm_public_ip" "pipdata" {
    for_each = var.bas_map
  name                = each.value.pip_name
  resource_group_name = each.value.resource_group_name
}