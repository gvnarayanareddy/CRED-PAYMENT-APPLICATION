data "azurerm_client_config" "current" {}

# ---------------------------------------------------------
# Azure Key Vault
# ---------------------------------------------------------

resource "azurerm_key_vault" "kv" {
  name                = var.key_vault_name
  location            = var.location
  resource_group_name = var.key_vault_resource_group_name

  tenant_id = data.azurerm_client_config.current.tenant_id
  sku_name  = "standard"

  purge_protection_enabled   = false
  soft_delete_retention_days = 7
}

# ---------------------------------------------------------
# Access Policy - Existing Application / Service Principal
# ---------------------------------------------------------

resource "azurerm_key_vault_access_policy" "postgres_access_policy" {
  key_vault_id = azurerm_key_vault.kv.id

  tenant_id = data.azurerm_client_config.current.tenant_id

  object_id = "367311af-8a5f-4358-a0ca-1224a6f35df0"

  secret_permissions = [
    "Get",
    "List",
    "Set",
    "Delete",
    "Recover"
  ]
}

resource "azurerm_key_vault_access_policy" "terraform_access_policy" {
  key_vault_id = azurerm_key_vault.kv.id

  tenant_id = data.azurerm_client_config.current.tenant_id

  object_id = "5ff743ec-b117-4370-a21b-f8f1ad725b12"

  secret_permissions = [
    "Get",
    "List",
    "Set",
    "Delete",
    "Recover"
  ]
}

# ---------------------------------------------------------
# Access Policy - Terraform / Azure DevOps Identity
# ---------------------------------------------------------



# ---------------------------------------------------------
# PostgreSQL Admin Username Secret
# ---------------------------------------------------------


resource "azurerm_key_vault_secret" "postgres_admin_username" {
  name         = "postgres-admin-username"
  value        = var.postgres_admin_username
  key_vault_id = azurerm_key_vault.kv.id

  depends_on = [
    azurerm_key_vault_access_policy.terraform_access_policy
  ]
}
# ---------------------------------------------------------
# PostgreSQL Admin Password Secret
# ---------------------------------------------------------

resource "azurerm_key_vault_secret" "postgres_admin_password" {
  name         = "postgres-admin-password"
  value        = var.postgres_admin_password
  key_vault_id = azurerm_key_vault.kv.id

  depends_on = [
    azurerm_key_vault_access_policy.terraform_access_policy
  ]
}

# ---------------------------------------------------------
# PostgreSQL Database Name Secret
# ---------------------------------------------------------

resource "azurerm_key_vault_secret" "postgres_database" {
  name         = "postgres-db-name"
  value        = var.postgres_database_name
  key_vault_id = azurerm_key_vault.kv.id

  depends_on = [
    azurerm_key_vault_access_policy.terraform_access_policy
  ]
}

# ---------------------------------------------------------
# PostgreSQL FQDN Secret
# ---------------------------------------------------------

resource "azurerm_key_vault_secret" "postgres_fqdn" {
  name         = "postgres-fqdn"
  value        = var.postgres_fqdn
  key_vault_id = azurerm_key_vault.kv.id

  depends_on = [
    azurerm_key_vault_access_policy.terraform_access_policy
  ]
}