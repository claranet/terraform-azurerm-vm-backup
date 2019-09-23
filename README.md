# Azure VM - Enable backup
[![Changelog](https://img.shields.io/badge/changelog-release-green.svg)](CHANGELOG.md) [![Notice](https://img.shields.io/badge/notice-copyright-yellow.svg)](NOTICE) [![Apache V2 License](https://img.shields.io/badge/license-Apache%20V2-orange.svg)](LICENSE)[![TF Registry](https://img.shields.io/badge/terraform-registry-blue.svg)](https://registry.terraform.io/modules/claranet/vm-backup/azurerm/)

This terraform module enable VM backup protection on the specified instance.

## Requirements

* [AzureRM Terraform provider](https://www.terraform.io/docs/providers/azurerm/) >= 1.32

## Terraform version compatibility
 
| Module version | Terraform version |
|----------------|-------------------|
| >= 2.x.x       | 0.12.x            |
| < 2.x.x        | 0.11.x            |

## Usage

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
|------|-------------|:----:|:-----:|:-----:|
| backup\_policy\_id | Backup policy to attach | string | n/a | yes |
| backup\_recovery\_vault\_name | Backup recovery vault name | string | n/a | yes |
| client\_name | Client name/account used in resource naming | string | n/a | yes |
| environment | Project environment | string | n/a | yes |
| location | Specifies the supported Azure location where the resource exists. | string | n/a | yes |
| location\_short | Short version of the Azure location, used by naming convention. | string | n/a | yes |
| resource\_group\_name | The name of the resource group in which the VM has been created. | string | n/a | yes |
| stack | Project stack name | string | n/a | yes |
| vm\_count | Number of vm for attaching the Backup policy | string | n/a | yes |
| vm\_ids | List of Azure VM ID to attach to the Backup policy | list(string) | n/a | yes |

## Related documentation

~~[Enable backup protection via Azure CLI](https://github.com/MicrosoftDocs/azure-docs/blob/master/articles/backup/quick-backup-vm-cli.md)~~

[Enable backup protection via Terraform](https://www.terraform.io/docs/providers/azurerm/r/recovery_services_protection_policy_vm.html)
