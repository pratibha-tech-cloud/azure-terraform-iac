resource "azurerm_resource_group" "rgblock" {
  name = "rg-Azure"
  location = "Central India"
}

resource "azurerm_virtual_network" "vnetblock" {
  name = "rg-new-vnet"
  resource_group_name = azurerm_resource_group.rgblock.name
  location = azurerm_resource_group.rgblock.location
  address_space = ["10.0.0.0/16"]
}
resource "azurerm_subnet" "subnetblock" {
  name = "rg-new-subnet"
  virtual_network_name = azurerm_virtual_network.vnetblock.name
  resource_group_name = azurerm_resource_group.rgblock.name
  address_prefixes = ["10.0.0.0/24"]
}
resource "azurerm_network_interface" "nicblock" {
  name = "rg-new-nic"
  resource_group_name = azurerm_resource_group.rgblock.name
  location = azurerm_resource_group.rgblock.location

  ip_configuration {
    name = "internal"
    subnet_id = azurerm_subnet.subnetblock.id
    private_ip_address_allocation = "Dynamic"
    }
}
