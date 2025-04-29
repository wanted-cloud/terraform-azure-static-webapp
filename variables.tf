variable "name" {
  description = "Name of the Azure service plan."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group in which the Azure service plan will be created."
  type        = string
}

variable "location" {
  description = "Location of the resource group in which the Azure service plan will be created, if not set it will be the same as the resource group."
  type        = string
  default     = ""
}

variable "tags" {
  description = "Key value pairs to assign to the resource."
  type        = map(string)
  default     = {}
}

variable "sku_size" {
  description = "The SKU of the Static Web App."
  type        = string
  default     = "Free"
}

variable "sku_tier" {
  description = "The SKU tier of the Static Web App."
  type        = string
  default     = "Free"
}

variable "identity_type" {
  description = "The type of identity to use for the Static Web App."
  type        = string
  default     = "UserAssigned"
}

variable "user_assigned_identities" {
  description = "List of user assigned identities for the Application gateway."
  type        = list(string)
  default     = []
}

variable "repository_branch" {
  description = "The branch of the repository for the Static Web App."
  type        = string
  default     = ""
}

variable "repository_url" {
  description = "The URL of the repository for the Static Web App."
  type        = string
  default     = ""
}

variable "repository_token" {
  description = "The token for the repository for the Static Web App."
  type        = string
  default     = ""
}

variable "public_network_access_enabled" {
  description = "Enable or disable public network access for the Static Web App."
  type        = bool
  default     = true
}

variable "preview_environments_enabled" {
  description = "Enable or disable preview environments for the Static Web App."
  type        = bool
  default     = true
}

variable "configuration_file_changes_enabled" {
  description = "Enable or disable configuration file changes for the Static Web App."
  type        = bool
  default     = true
}

variable "app_settings" {
  description = "A map of app settings for the Static Web App."
  type        = map(string)
  default     = {}
}

variable "basic_auth" {
  description = "Basic authentication settings for the Static Web App."
  type = object({
    password     = string
    environments = optional(string, "AllEnvironments")
  })
  default = null
}