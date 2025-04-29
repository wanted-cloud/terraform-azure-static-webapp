/*
 * # wanted-cloud/terraform-azure-static-webapp
 * 
 * Terraform building block managing an Azure Static Web App.
 */
resource "azurerm_static_web_app" "this" {
  name                = var.name
  location            = var.location != "" ? var.location : data.azurerm_resource_group.this.location
  resource_group_name = data.azurerm_resource_group.this.name

  sku_size = var.sku_size
  sku_tier = var.sku_tier

  repository_branch = var.repository_branch != "" ? var.repository_branch : null
  repository_url    = var.repository_url != "" ? var.repository_url : null
  repository_token  = var.repository_token != "" ? var.repository_token : null

  public_network_access_enabled = var.public_network_access_enabled

  configuration_file_changes_enabled = var.configuration_file_changes_enabled
  preview_environments_enabled       = var.preview_environments_enabled

  app_settings = var.app_settings

  tags = merge(local.metadata.tags, var.tags)

  dynamic "identity" {
    for_each = (var.identity_type == "UserAssigned" && length(var.user_assigned_identities) > 0) || (var.identity_type == "SystemAssigned" || var.identity_type == "SystemAssigned, UserAssigned") ? [1] : []
    content {
      type         = var.identity_type
      identity_ids = var.user_assigned_identities
    }
  }

  dynamic "basic_auth" {
    for_each = try(var.basic_auth.password, false) ? [1] : []
    content {
      password     = basic_auth.value
      environments = basic_auth.environments
    }

  }

  timeouts {
    create = try(
      local.metadata.resource_timeouts["azurerm_static_web_app"]["create"],
      local.metadata.resource_timeouts["default"]["create"]
    )
    read = try(
      local.metadata.resource_timeouts["azurerm_static_web_app"]["read"],
      local.metadata.resource_timeouts["default"]["read"]
    )
    update = try(
      local.metadata.resource_timeouts["azurerm_static_web_app"]["update"],
      local.metadata.resource_timeouts["default"]["update"]
    )
    delete = try(
      local.metadata.resource_timeouts["azurerm_static_web_app"]["delete"],
      local.metadata.resource_timeouts["default"]["delete"]
    )
  }
}