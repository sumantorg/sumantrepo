
variable "vms" {}

data "azurerm_key_vault" "kvs" {
  for_each            = var.vms
  name                = each.value.kv_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_subnet" "data_subnet_fortend" {
  for_each             = var.vms
  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}





resource "random_password" "apass" {
  for_each         = var.vms
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}
resource "azurerm_key_vault_secret" "password" {
  for_each     = var.vms
  name         = "${each.value.vm_name}-password"
  value        = random_password.apass[each.key].result
  key_vault_id = data.azurerm_key_vault.kvs[each.key].id
}


resource "azurerm_network_interface" "nic" {
  for_each            = var.vms
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.data_subnet_fortend[each.key].id
    private_ip_address_allocation = "Dynamic"

  }
}



resource "azurerm_windows_virtual_machine" "vm-block" {
  for_each                        = var.vms
  name                            = each.value.vm_name
  resource_group_name             = each.value.resource_group_name
  location                        = each.value.location
  size                            = each.value.size
  admin_username                  = "devopsadmin"
  admin_password                  = azurerm_key_vault_secret.password[each.key].value
  # disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.nic[each.key].id,
  ]



  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
 
  
custom_data = filebase64("${path.module}/install_iis.ps1")

}









