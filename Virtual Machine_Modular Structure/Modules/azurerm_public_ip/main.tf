resource "azurerm_public_ip" "ntas_public_ip" {
  for_each = var.ip_config
  name                = each.value.public_ip_name
  location            = each.value.resource_group_location
  resource_group_name = each.value.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}