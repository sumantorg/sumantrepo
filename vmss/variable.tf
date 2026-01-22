variable "resource_group_name" {
    description = "vmss ka scaling"
    type        = string
    default = "rg-terraform-vmss"
}
variable "location" {
    description = "Azure Region"
    type        = string
    default = "central india"
  
}
variable "vmss" {
type = string
default = "vmss"
  
}

variable "admin_username" {
  type = string
  default = "azureuser"
}

variable "admin_password" {
    type = string
    default = "Azure@123"
  
}