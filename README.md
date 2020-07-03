# Azure VM - Enable backup
[![Changelog](https://img.shields.io/badge/changelog-release-green.svg)](CHANGELOG.md) [![Notice](https://img.shields.io/badge/notice-copyright-yellow.svg)](NOTICE) [![Apache V2 License](https://img.shields.io/badge/license-Apache%20V2-orange.svg)](LICENSE) [![TF Registry](https://img.shields.io/badge/terraform-registry-blue.svg)](https://registry.terraform.io/modules/claranet/vm-backup/azurerm/)

This terraform module enable VM backup protection on the specified instance.

## Version compatibility

| Module version    | Terraform version | AzureRM version |
|-------------------|-------------------|-----------------|
| >= 3.x.x          | 0.12.x            | >= 2.0          |
| >= 2.x.x, < 3.x.x | 0.12.x            | <  2.0          |
| <  2.x.x          | 0.11.x            | <  2.0          |

## Usage

This module is optimized to work with the [Claranet terraform-wrapper](https://github.com/claranet/terraform-wrapper) tool
which set some terraform variables in the environment needed by this module.
More details about variables set by the `terraform-wrapper` available in the [documentation](https://github.com/claranet/terraform-wrapper#environment).

```hcl
module "azure-region" {
  source  = "claranet/regions/azurerm"
  version = "x.x.x"

  azure_region = var.azure_region
}

module "rg" {
  source  = "claranet/rg/azurerm"
  version = "x.x.x"

  location    = module.azure-region.location
  client_name = var.client_name
  environment = var.environment
  stack       = var.stack
}

module "backup-recovery-vault" {
  source = "..."

  [..]
}

module "vm-001" {
  source = "..."

  [..]
}

module "vm-002" {
  source = "..."

  [..]
}

module "vm-backup" {
  source  = "claranet/vm-backup/azurerm"
  version = "x.x.x"

  location            = module.azure-region.location
  location_short      = module.azure-region.location_short
  resource_group_name = module.rg.resource_group_name
  client_name         = var.client_name
  environment         = var.environment
  stack               = var.stack

  backup_policy_id           = module.backup-recovery-vault.backup_policy_id
  backup_recovery_vault_name = module.backup-recovery-vault.backup_recovery_vault_name

  vm_count = "2"
  vm_ids   = [module.vm-001.vm_id, module.vm-002.vm_id]
}

```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| backup\_policy\_id | Backup policy to attach | `string` | n/a | yes |
| backup\_recovery\_vault\_name | Backup recovery vault name | `string` | n/a | yes |
| client\_name | Client name/account used in naming | `string` | n/a | yes |
| environment | Project environment | `string` | n/a | yes |
| location | Azure region to use | `string` | n/a | yes |
| location\_short | Short string for Azure location | `string` | n/a | yes |
| resource\_group\_name | Name of the resource group | `string` | n/a | yes |
| stack | Project stack name | `string` | n/a | yes |
| vm\_count | Number of Azure vm to attach to the Backup policy | `number` | n/a | yes |
| vm\_ids | List of Azure VM ID to attach to the Backup policy | `list(string)` | n/a | yes |

## Outputs

No output.

## Related documentation

~~[Enable backup protection via Azure CLI](https://github.com/MicrosoftDocs/azure-docs/blob/master/articles/backup/quick-backup-vm-cli.md)~~

Enable backup protection via Terraform: [terraform.io/docs/providers/azurerm/r/recovery_services_protection_policy_vm.html](https://www.terraform.io/docs/providers/azurerm/r/recovery_services_protection_policy_vm.html)
