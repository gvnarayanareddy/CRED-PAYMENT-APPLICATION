variable "name_prefix" {

  type = string

}

variable "resource_group_name" {
  type = string
}
variable "location" {
  type = string
}

variable "retention_days" {
  description = "The number of days to retain the logs in the Log Analytics workspace."
  type        = number
}
variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
  default = {
    environment = "dev"
  }
}

