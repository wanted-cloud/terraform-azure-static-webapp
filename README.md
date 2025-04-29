<!-- BEGIN_TF_DOCS -->
# wanted-cloud/terraform-azure-static-webapp

Terraform building block managing an Azure Static Web App.

## Table of contents

- [Requirements](#requirements)
- [Providers](#providers)
- [Variables](#inputs)
- [Outputs](#outputs)
- [Resources](#resources)
- [Usage](#usage)
- [Contributing](#contributing)

## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (>= 1.9)

- <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) (>=4.20.0)

## Providers

The following providers are used by this module:

- <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) (>=4.20.0)

## Required Inputs

The following input variables are required:

### <a name="input_name"></a> [name](#input\_name)

Description: Name of the Azure service plan.

Type: `string`

### <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name)

Description: Name of the resource group in which the Azure service plan will be created.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_app_settings"></a> [app\_settings](#input\_app\_settings)

Description: A map of app settings for the Static Web App.

Type: `map(string)`

Default: `{}`

### <a name="input_basic_auth"></a> [basic\_auth](#input\_basic\_auth)

Description: Basic authentication settings for the Static Web App.

Type:

```hcl
object({
    password     = string
    environments = optional(string, "AllEnvironments")
  })
```

Default: `null`

### <a name="input_configuration_file_changes_enabled"></a> [configuration\_file\_changes\_enabled](#input\_configuration\_file\_changes\_enabled)

Description: Enable or disable configuration file changes for the Static Web App.

Type: `bool`

Default: `true`

### <a name="input_identity_type"></a> [identity\_type](#input\_identity\_type)

Description: The type of identity to use for the Static Web App.

Type: `string`

Default: `"UserAssigned"`

### <a name="input_location"></a> [location](#input\_location)

Description: Location of the resource group in which the Azure service plan will be created, if not set it will be the same as the resource group.

Type: `string`

Default: `""`

### <a name="input_metadata"></a> [metadata](#input\_metadata)

Description: Metadata definitions for the module, this is optional construct allowing override of the module defaults defintions of validation expressions, error messages, resource timeouts and default tags.

Type:

```hcl
object({
    resource_timeouts = optional(
      map(
        object({
          create = optional(string, "30m")
          read   = optional(string, "5m")
          update = optional(string, "30m")
          delete = optional(string, "30m")
        })
      ), {}
    )
    tags                     = optional(map(string), {})
    validator_error_messages = optional(map(string), {})
    validator_expressions    = optional(map(string), {})
  })
```

Default: `{}`

### <a name="input_preview_environments_enabled"></a> [preview\_environments\_enabled](#input\_preview\_environments\_enabled)

Description: Enable or disable preview environments for the Static Web App.

Type: `bool`

Default: `true`

### <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled)

Description: Enable or disable public network access for the Static Web App.

Type: `bool`

Default: `true`

### <a name="input_repository_branch"></a> [repository\_branch](#input\_repository\_branch)

Description: The branch of the repository for the Static Web App.

Type: `string`

Default: `""`

### <a name="input_repository_token"></a> [repository\_token](#input\_repository\_token)

Description: The token for the repository for the Static Web App.

Type: `string`

Default: `""`

### <a name="input_repository_url"></a> [repository\_url](#input\_repository\_url)

Description: The URL of the repository for the Static Web App.

Type: `string`

Default: `""`

### <a name="input_sku_size"></a> [sku\_size](#input\_sku\_size)

Description: The SKU of the Static Web App.

Type: `string`

Default: `"Free"`

### <a name="input_sku_tier"></a> [sku\_tier](#input\_sku\_tier)

Description: The SKU tier of the Static Web App.

Type: `string`

Default: `"Free"`

### <a name="input_tags"></a> [tags](#input\_tags)

Description: Key value pairs to assign to the resource.

Type: `map(string)`

Default: `{}`

### <a name="input_user_assigned_identities"></a> [user\_assigned\_identities](#input\_user\_assigned\_identities)

Description: List of user assigned identities for the Application gateway.

Type: `list(string)`

Default: `[]`

## Outputs

No outputs.

## Resources

The following resources are used by this module:

- [azurerm_static_web_app.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/static_web_app) (resource)
- [azurerm_resource_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) (data source)

## Usage

> For more detailed examples navigate to `examples` folder of this repository.

Module was also published via Terraform Registry and can be used as a module from the registry.

```hcl
module "example" {
  source  = "wanted-cloud/static-webapp/azure"
  version = "x.y.z"
}
```

### Basic usage example

The minimal usage for the module is as follows:

```hcl
module "template" {
    source = "../.."
 
    name = "example"
    resource_group_name = "example-rg"
}
```
## Contributing

_Contributions are welcomed and must follow [Code of Conduct](https://github.com/wanted-cloud/.github?tab=coc-ov-file) and common [Contributions guidelines](https://github.com/wanted-cloud/.github/blob/main/docs/CONTRIBUTING.md)._

> If you'd like to report security issue please follow [security guidelines](https://github.com/wanted-cloud/.github?tab=security-ov-file).
---
<sup><sub>_2025 &copy; All rights reserved - WANTED.solutions s.r.o._</sub></sup>
<!-- END_TF_DOCS -->