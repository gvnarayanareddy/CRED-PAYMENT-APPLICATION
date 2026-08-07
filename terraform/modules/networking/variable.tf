variable "name_prefix" {

  type = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}
variable "location" {
  description = "The Azure region where the resources will be created."
  type        = string

}
variable "vnet_address_space" {
  description = "The address space for the virtual network."
  type        = string

}

variable "aks_subnet_prefix" {
  description = "The address space for the AKS subnet."
  type        = string
}

variable "postgres_subnet_prefix" {
  description = "The address space for the PostgreSQL subnet."
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
  default = {
    environment = "dev"
  }
}