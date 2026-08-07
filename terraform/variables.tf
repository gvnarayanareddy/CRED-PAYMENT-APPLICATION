variable "subscription_id" {
  description = "The subscription ID for the Azure account."
  type        = string

}

variable "location" {
  description = "The Azure region where resources will be created."
  type        = string
  default     = "CANADA CENTRAL"

}
variable "Vnet_address_space" {
  description = "The address space for the virtual network."
  type        = string
  default     = "10.0.0.0/16"
}

variable "aks_subnet_prefix" {
  description = "The address space for the subnet."
  type        = string
  default     = "10.0.1.0/24"
}

variable "postgres_subnet_prefix" {
  description = "The address space for the subnet."
  type        = string
  default     = "10.0.2.0/24"
}
variable "node_count" {
  description = "The number of nodes in the AKS cluster."
  type        = number
  default     = 2
}

variable "node_mini_count" {
  description = "The minimum number of nodes in the AKS cluster."
  type        = number
  default     = 2
}

variable "node_max_count" {
  description = "The maximum number of nodes in the AKS cluster."
  type        = number
  default     = 2

}

variable "vm_size" {
  description = "The size of the virtual machines in the AKS cluster."
  type        = string
  default     = "Standard_DS2aldss_v6"

}
variable "postgres_version" {
  description = "The version of PostgreSQL to use."
  type        = string
  default     = "17"
}
variable "postgres_admin_username" {
  description = "The admin username for PostgreSQL."
  type        = string
  default     = "creadpayadmin"
}
variable "database_name" {
  description = "The name of the PostgreSQL database."
  type        = string
  default     = "creadpay"
}
variable "log_retention_days" {
  description = "The number of days to retain logs."
  type        = number
  default     = 7
}
variable "key_vault_name" {
  description = "The name of the Azure Key Vault."
  type        = string
}
variable "key_vault_resource_group" {
  description = "The resource group for the Azure Key Vault."
  type        = string
}
    