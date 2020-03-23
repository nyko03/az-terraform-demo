output "ResourceGroup_name" {
  value = azurerm_resource_group.rg.name
}

output "KeyVault_name" {
  value = azurerm_key_vault.kv.name
}

output "StorageAccount_id" {
  value = azurerm_storage_account.sac.id
}

output "StorageAccount_name" {
  value = azurerm_storage_account.sac.name
}

output "Blob_endpoint" {
  value = azurerm_storage_account.sac.primary_blob_endpoint
}

#output "Blob_key" {
#  value = azurerm_storage_account.sac.primary_access_key
#}


