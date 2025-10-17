data "azurerm_public_ip" "public_ip" {
    name = "test-public-ip1"
    resource_group_name = var.resource_group_name
}
data "azurerm_subnet" "frontend_subnet" {
    name = "frontend-subnet"
    virtual_network_name = "test-vnet1"
    resource_group_name = var.resource_group_name
}