data "azurerm_subnet" "sub" {
  name                 = var.subnet_name
  virtual_network_name = var.virtual_network_name
  resource_group_name  = var.resource_group_name
}
resource "azurerm_public_ip" "example" {
  for_each            = var.virtual_machine
  name                = each.value.pip_name
  resource_group_name = var.resource_group_name
  location            = each.value.location
  allocation_method   = "Static"
}
resource "azurerm_network_interface" "example" {
  for_each            = var.virtual_machine
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = var.resource_group_name
  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.sub.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.example[each.key].id
  }
}
resource "azurerm_windows_virtual_machine" "example" {
  for_each              = var.virtual_machine
  name                  = each.key
  resource_group_name   = var.resource_group_name
  location              = each.value.location
  size                  = each.value.size
  admin_username        = "anshadmin01"
  admin_password        = "admin@123456"
  network_interface_ids = [azurerm_network_interface.example[each.key].id]


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

}