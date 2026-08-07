resource "azurerm_log_analytics_workspace" "law" {
  name                = "law-${var.name_prefix}"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = var.retention_days
  tags                = var.tags

}
resource "azurerm_log_analytics_solution" "solution" {
  solution_name         = "ContainerInsights"
  location              = var.location
  resource_group_name   = var.resource_group_name
  workspace_resource_id = azurerm_log_analytics_workspace.law.id
  workspace_name        = azurerm_log_analytics_workspace.law.name
  tags                  = var.tags
  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/ContainerInsights"
  }
}