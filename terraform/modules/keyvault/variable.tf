variable "key_vault_name" {
  type = string
}

variable "location" {
  type = string
}

variable "key_vault_resource_group_name" {
  type = string
}

variable "keyvault_access_object_id" {
  type = string
}

variable "postgres_admin_username" {
  type      = string
  sensitive = true
}

variable "postgres_admin_password" {
  type      = string
  sensitive = true
}

variable "postgres_database_name" {
  type = string
}

variable "postgres_fqdn" {
  type = string
}