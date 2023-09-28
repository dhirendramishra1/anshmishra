resource "azurerm_resource_group" "RG" {
  for_each = var.azurerm_resource_group
  name     = each.key
  location = each.value.location
}