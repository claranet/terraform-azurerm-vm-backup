# Azure VM - Enable backup

This terraform module enable VM backup protection on the specified instance.

## Requirements

* [AzureRM Terraform provider](https://www.terraform.io/docs/providers/azurerm/) >= 1.32

## Terraform version compatibility
 
| Module version | Terraform version |
|----------------|-------------------|
| >= 2.x.x       | 0.12.x            |
| < 2.x.x        | 0.11.x            |

## Usage

```shell
module "az-region" {
  source = "git::ssh://git@git.fr.clara.net/claranet/cloudnative/projects/cloud/azure/terraform/modules/regions.git?ref=vX.X.X"

  azure_region = "${var.azure_region}"
}

module "rg" {
  source = "git::ssh://git@git.fr.clara.net/claranet/cloudnative/projects/cloud/azure/terraform/modules/rg.git?ref=vX.X.X"

  location    = "${module.az-region.location}"
  client_name = "${var.client_name}"
  environment = "${var.environment}"
  stack       = "${var.stack}"
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
  source = "git::ssh://git@git.fr.clara.net/claranet/cloudnative/projects/cloud/azure/terraform/modules/vm-backup.git?ref=vX.X.X"

  location            = "${module.az-region.location}"
  location_short      = "${module.az-region.location-short}"
  resource_group_name = "${module.rg.resource_group_name}"
  client_name         = "${var.client_name}"
  environment         = "${var.environment}"
  stack               = "${var.stack}"

  backup_policy_id           = "${module.backup-recovery-vault.backup_policy_id}"
  backup_recovery_vault_name = "${module.backup-recovery-vault.backup_recovery_vault_name}"

  vm_count = "2"
  vm_ids   = ["${module.vm-001.vm_id}", "${module.vm-002.vm_id}"]
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
| vm\_ids | List of Azure VM ID to attach to the Backup policy | list | n/a | yes |

## Related documentation

~~[Enable backup protection via Azure CLI](https://github.com/MicrosoftDocs/azure-docs/blob/master/articles/backup/quick-backup-vm-cli.md)~~

[Enable backup protection via Terraform](https://www.terraform.io/docs/providers/azurerm/r/recovery_services_protection_policy_vm.html)
