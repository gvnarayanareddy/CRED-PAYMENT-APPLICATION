locals {
  name_prefix = "credpays1"

  tags = {
    project    = "credpay"
    managed_by = "terraform"
  }
}

module "resource_group" {
  source   = "./modules/resourcegroup"
  name     = "rg-${local.name_prefix}"
  location = var.location
  tags     = local.tags
}

module "networking" {
  source = "./modules/networking"

  name_prefix         = local.name_prefix
  resource_group_name = module.resource_group.name
  location            = var.location

  vnet_address_space     = var.Vnet_address_space
  aks_subnet_prefix      = var.aks_subnet_prefix
  postgres_subnet_prefix = var.postgres_subnet_prefix

  tags = local.tags
}

module "monitoring" {
  source = "./modules/monitoring"

  name_prefix         = local.name_prefix
  resource_group_name = module.resource_group.name
  location            = var.location
  retention_days      = var.log_retention_days

  tags = local.tags
}

module "postgres" {
  source = "./modules/postgres"

  name_prefix         = local.name_prefix
  resource_group_name = module.resource_group.name
  location            = var.location

  admin_username   = var.postgres_admin_username
  database_name    = var.database_name
  postgres_version = var.postgres_version

  tags = local.tags
}

module "aks" {
  source = "./modules/aks"

  name_prefix         = local.name_prefix
  resource_group_name = module.resource_group.name
  location            = var.location

  aks_subnet_id = module.networking.subnet_ids["aks"]

  log_analytics_workspace_id = module.monitoring.workspace_id

  node_count     = var.node_count
  node_min_count = var.node_mini_count
  node_max_count = var.node_max_count

  vm_size = var.vm_size
  tags    = local.tags
}

module "keyvault" {
  source = "./modules/keyvault"

  key_vault_name                = "kv-gvn-${local.name_prefix}"
  location                      = var.location
  key_vault_resource_group_name = module.resource_group.name

  postgres_fqdn           = module.postgres.fqdn
  postgres_admin_username = module.postgres.admin_username
  postgres_admin_password = module.postgres.admin_password
  postgres_database_name  = module.postgres.database_name
}