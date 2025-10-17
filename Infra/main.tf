module "azurerm_resource_group" {
  source                  = "../Module/azurerm_resource_group"
  resource_group_name     = "test-rgg1"
  resource_group_location = "Centralindia"
}
module "azurerm_virtual_network" {
  depends_on              = [module.azurerm_resource_group]
  source                  = "../Module/azurerm_virtual_network"
  virtual_network_name    = "test-vnet1"
  address_space           = ["10.0.0.0/16"]
  resource_group_name     = "test-rgg1"
  resource_group_location = "Centralindia"
}
module "azurerm_frontend_subnet" {
  depends_on           = [module.azurerm_virtual_network]
  source               = "../Module/azurerm_subnet"
  subnet_name          = "frontend-subnet"
  address_prefixes     = ["10.0.1.0/24"]
  resource_group_name  = "test-rgg1"
  virtual_network_name = "test-vnet1"
}
module "azurerm_backend_subnet" {
  depends_on           = [module.azurerm_virtual_network]
  source               = "../Module/azurerm_subnet"
  subnet_name          = "backend-subnet"
  address_prefixes     = ["10.0.2.0/24"]
  resource_group_name  = "test-rgg1"
  virtual_network_name = "test-vnet1"
}
module "azurerm_public_ip" {
  depends_on              = [module.azurerm_resource_group]
  source                  = "../Module/azurerm_public_ip"
  public_ip_name          = "test-public-ip1"
  resource_group_name     = "test-rgg1"
  resource_group_location = "Centralindia"
}
module "virtual_machine" {
  depends_on              = [module.azurerm_frontend_subnet, module.azurerm_public_ip]
  source                  = "../Module/azurerm_virtual_machine"
  virtual_machine_name    = "frontend-vm1"
  resource_group_name     = "test-rgg1"
  resource_group_location = "Centralindia"
}