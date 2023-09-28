modulerg = {
  ANSH_RG = {
    location = "central india"
  }
}
modulevnet = {
ANSH_VNET = {
    location = "central india"
    resource_group_name = "ANSH_RG"
    address_space = ["10.0.0.0/16"]
}
}
modulesubnet = {
    AzureBastionSubnet = {
        resource_group_name = "ANSH_RG"
        virtual_network_name = "ANSH_VNET"
         address_prefixes = ["10.0.0.0/24"]
    }
}
modulevm= {
  "anshvm" = {
    pip_name = "gest-pip"
    location = "central india"
    nic_name = "window-nic"
    size     = "Standard_D2s_v3"
  }
}
modulevmodulevm = {
  "anshvm" = {
    pip_name = "gest-pip"
    location = "central india"
    nic_name = "window-nic"
    size     = "Standard_D2s_v3"
  }
}
resource_group_name  = "ANSH_RG"
virtual_network_name = "ANSH_VNET"
subnet_name          = "winsubnet"