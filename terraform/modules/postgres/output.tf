output "postgresql_server_id" {
  value = azurerm_postgresql_flexible_server.psql.id
}

output "server_name" {
  value = azurerm_postgresql_flexible_server.psql.name
}

output "fqdn" {
  value = azurerm_postgresql_flexible_server.psql.fqdn
}

output "database_name" {
  value = azurerm_postgresql_flexible_server_database.pdb.name
}

output "admin_username" {
  value = azurerm_postgresql_flexible_server.psql.administrator_login
}

output "admin_password" {
  value     = random_password.admin.result
  sensitive = true
}