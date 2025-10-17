resource "azurerm_network_interface" "nic" {
    name = "frontend-nic1"
    location = var.resource_group_location
    resource_group_name = var.resource_group_name
    ip_configuration {
      name = "internal"
      public_ip_address_id = data.azurerm_public_ip.public_ip.id
      subnet_id = data.azurerm_subnet.frontend_subnet.id
      private_ip_address_allocation = "Dynamic"
    }
}
resource "azurerm_virtual_machine" "vm" {
    name = var.virtual_machine_name
    location = var.resource_group_location
    resource_group_name = var.resource_group_name
    network_interface_ids = [azurerm_network_interface.nic.id]
    vm_size = "Standard_B1s"
    storage_os_disk {
        name = "myosdisk"
        caching = "ReadWrite"
        create_option = "FromImage"
        managed_disk_type = "Standard_LRS"
    }
    storage_image_reference {
        publisher = "Canonical"
        offer = "UbuntuServer"
        sku = "18.04-LTS"
        version = "latest"
    }
    os_profile {
      computer_name = "hostname"
      admin_username = "testadmin"
      admin_password = "Passward123!"
    }
    os_profile_linux_config {
      disable_password_authentication = false
    }
}