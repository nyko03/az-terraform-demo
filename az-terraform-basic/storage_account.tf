resource "azurerm_storage_account" "sac" {
  name                = "${var.project.name}${var.env}sa01"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  account_kind              = "StorageV2"
  account_tier              = "Standard"
  access_tier               = "Cool"
  account_replication_type  = "ZRS"
  enable_https_traffic_only = true

  tags = var.common_tags
}

resource "azurerm_storage_container" "blo" {
  name                 = "blob-container"
  storage_account_name = azurerm_storage_account.sac.name
}