variable "name_prefix" {
  description = "The prefix to use for naming resources."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which the PostgreSQL server is created."
  type        = string
}

variable "location" {
  description = "The Azure region in which the PostgreSQL server is created."
  type        = string
}

variable "admin_username" {
  description = "The administrator username for the PostgreSQL server."
  type        = string
}
variable "database_name" {
  description = "The name of the PostgreSQL database."
  type        = string
}
variable "postgres_version" {
  description = "The version of the PostgreSQL server."
  type        = string
}
variable "tags" {
  description = "A map of tags to assign to the PostgreSQL server."
  type        = map(string)
  default     = {}
}