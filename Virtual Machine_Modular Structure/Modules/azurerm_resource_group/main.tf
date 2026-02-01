resource "azurerm_resource_group" "rg" {
  for_each = var.rg_config
  name     = each.value.resource_group_name
  location = each.value.resource_group_location
}
