resource "azurerm_key_vault" "kv" {
  name                            = "${var.project.name}-secret-kv"
  location                        = var.region.name
  resource_group_name             = azurerm_resource_group.rg.name
  enabled_for_disk_encryption     = true
  enabled_for_template_deployment = true
  tenant_id                       = var.tenant_id

  sku_name = "standard"

  tags = var.common_tags
}

resource "azurerm_key_vault_access_policy" "prsnl" {
  key_vault_id = azurerm_key_vault.kv.id

  tenant_id = var.tenant_id
  object_id = var.object_id

  key_permissions = ["get", "list", "update", "create", "import", "delete", "recover", "backup", "restore"]

  secret_permissions = ["get", "list", "set", "delete", "recover", "backup", "restore"]

  certificate_permissions = ["get", "list", "update", "create", "import", "delete", "recover", "backup", "restore", "managecontacts", "manageissuers", "getissuers", "deleteissuers", "purge"]
}

