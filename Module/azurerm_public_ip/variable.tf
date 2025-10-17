variable "public_ip_name" {
    description = "The name of the public ip address."
    type = string
}
variable "resource_group_location" {
    description = "The Azure location where the public ip address will be created."
    type = string
}
variable "resource_group_name" {
    description = "The name of the resource group where the public ip address will be created."
    type = string
}
