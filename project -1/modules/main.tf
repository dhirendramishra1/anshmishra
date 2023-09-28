module "resource_gruop" {
  source = "../azurerm_Resource_group"
  azurerm_resource_group = var.modulerg

}
module "virtual_network" {
    source = "../azurerm_vnet"
  azurerm_virtual_network = var.modulevnet
  depends_on = [ module.resource_gruop ]
}
module "subnet" {
    source = "../azurerm_subnet"
    azurerm_subnet = var.modulesubnet
  
}
module "virtual_machine" {
  source = "../Window_vm"
  virtual_machine = var.modulevm
  
}