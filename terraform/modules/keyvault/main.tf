data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "kv" {
  name                = var.key_vault_name
  location            = var.location
  resource_group_name = var.key_vault_resource_group_name

  tenant_id = data.azurerm_client_config.current.tenant_id
  sku_name  = "standard"

  purge_protection_enabled   = false
  soft_delete_retention_days = 7
}

# Give current user/service principal access to Key Vault
resource "azurerm_key_vault_access_policy" "postgres_access_policy" {
  key_vault_id = azurerm_key_vault.kv.id

  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id = data.azurerm_client_config.current.object_id

  secret_permissions = [
    "Get",
    "List",
    "Set",
    "Delete"
  ]

  depends_on = [
    azurerm_key_vault.kv
  ]

  timeouts {
    create = "15m"
  }
}


# PostgreSQL Admin Username Secret
resource "azurerm_key_vault_secret" "postgres_admin_username" {
  name         = "postgres-admin-username"
  value        = var.postgres_admin_username
  key_vault_id = azurerm_key_vault.kv.id
}


# PostgreSQL Admin Password Secret
resource "azurerm_key_vault_secret" "postgres_admin_password" {
  name         = "postgres-admin-password"
  value        = var.postgres_admin_password
  key_vault_id = azurerm_key_vault.kv.id

  depends_on = [
    azurerm_key_vault_access_policy.postgres_access_policy
  ]
}


# PostgreSQL Database Name Secret
resource "azurerm_key_vault_secret" "postgres_database" {
  name         = "postgres-db-name"
  value        = var.postgres_database_name
  key_vault_id = azurerm_key_vault.kv.id

  depends_on = [
    azurerm_key_vault_access_policy.postgres_access_policy
  ]
}


# PostgreSQL FQDN Secret
resource "azurerm_key_vault_secret" "postgres_fqdn" {
  name         = "postgres-fqdn"
  value        = var.postgres_fqdn
  key_vault_id = azurerm_key_vault.kv.id

  depends_on = [
    azurerm_key_vault_access_policy.postgres_access_policy
  ]
}