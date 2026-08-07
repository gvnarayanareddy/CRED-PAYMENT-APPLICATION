variable "key_vault_name" {
  description = "The name of the Key Vault."
  type        = string
}

variable "location" {
  description = "The Azure region where the Key Vault will be created."
  type        = string
}

variable "key_vault_resource_group_name" {
  description = "The name of the resource group in which the Key Vault is created."
  type        = string
}

variable "postgres_fqdn" {
  description = "The fully qualified domain name of the PostgreSQL server."
  type        = string
}

variable "postgres_admin_username" {
  description = "The administrator username for the PostgreSQL server."
  type        = string
}

variable "postgres_admin_password" {
  description = "The administrator password for the PostgreSQL server."
  type        = string
  sensitive   = true
}

variable "postgres_database_name" {
  description = "The name of the PostgreSQL database."
  type        = string
}