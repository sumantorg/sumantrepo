resource "azurerm_virtual_network" "ntas-vnet" {
  for_each = var.vnet_config
  name                = each.value.virtual_network_name
  address_space       = each.value.address_space
  location            = each.value.virtual_network_location
  resource_group_name = each.value.resource_group_name
}