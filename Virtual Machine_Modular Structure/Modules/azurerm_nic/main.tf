resource "azurerm_network_interface" "mynic" {
  for_each = var.nic_config
  name                = each.value.nic_name
  location            = each.value.network_interface_location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.datasubnet[each.key].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = data.azurerm_public_ip.datapublicip[each.key].id
  }
}

# azurerm_network_interface.mynic["nic1"]
# azurerm_network_interface.mynic["nic2"]
# azurerm_network_interface.mynic["nic3"]

# data.azurerm_subnet.datasubnet["nic1"]
# data.azurerm_subnet.datasubnet["nic2"]

# data.azurerm_public_ip.datapublicip["nic1"]
# data.azurerm_public_ip.datapublicip["nic2"]