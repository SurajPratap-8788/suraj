
variable "resource_group_location" {
    description = "The Azure location where the network interface will be created."
    type = string
}
variable "resource_group_name" {
    description = "The name of the resource group where the network interface will be created."
    type = string   
}
variable "virtual_machine_name" {
    description = "The name of the virtual machine to which the network interface will be attached."
    type = string
}