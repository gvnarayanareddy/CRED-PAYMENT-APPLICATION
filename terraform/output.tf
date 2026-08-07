output "resource_group_name" {
  description = "Resource Group Name"
  value       = module.resource_group.name
}

output "vnet_name" {
  description = "Virtual Network Name"
  value       = module.networking.vnet_name
}

output "aks_subnet_id" {
  description = "AKS Subnet ID"
  value       = module.networking.subnet_ids["aks"]
}

output "aks_cluster_name" {
  description = "AKS Cluster Name"
  value       = module.aks.cluster_name
}

output "aks_resource_group" {
  description = "AKS Resource Group"
  value       = module.resource_group.name
}

output "aks_kubelet_identity_object_id" {
  description = "Object ID of the AKS kubelet managed identity"
  value       = module.aks.kubelet_identity_object_id
}

output "aks_oidc_issuer_url" {
  description = "AKS OIDC Issuer URL"
  value       = module.aks.oidc_issuer_url
}

output "aks_node_resource_group" {
  description = "AKS Node Resource Group"
  value       = module.aks.node_resource_group
}

output "get_credentials_command" {
  description = "Command to configure kubectl"
  value       = "az aks get-credentials --resource-group ${module.resource_group.name} --name ${module.aks.cluster_name} --overwrite-existing"
}

output "postgres_server_name" {
  description = "PostgreSQL Flexible Server Name"
  value       = module.postgres.server_name
}

output "postgres_fqdn" {
  description = "PostgreSQL Server FQDN"
  value       = module.postgres.fqdn
}

output "postgres_database_name" {
  description = "PostgreSQL Database Name"
  value       = module.postgres.database_name
}

output "postgres_admin_username" {
  description = "PostgreSQL Administrator Username"
  value       = module.postgres.admin_username
}

output "postgres_admin_password" {
  description = "PostgreSQL Administrator Password"
  value       = module.postgres.admin_password
  sensitive   = true
}

output "log_analytics_workspace_id" {
  description = "Log Analytics Workspace ID"
  value       = module.monitoring.workspace_id
}

output "key_vault_name" {
  description = "Azure Key Vault Name"
  value       = module.keyvault.key_vault_name
}

output "key_vault_id" {
  description = "Azure Key Vault ID"
  value       = module.keyvault.key_vault_id
}

