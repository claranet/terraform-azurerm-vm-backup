# Azure VM - Enable backup

This terraform module enable VM backup protection on the specified instance.

## Requirements

- Terraform ~> v0.11
- Terraform Azure provider ~> v1.18

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

  vm_ids = ["${module.vm-001.vm_id}", "${module.vm-002.vm_id}"]

```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| backup_policy_id | Backup policy to attach | string | - | yes |
| backup_recovery_vault_name | Backup recovery vault name | string | - | yes |
| client_name | Client name/account used in resource naming | string | - | yes |
| environment | Project environment | string | - | yes |
| location | Specifies the supported Azure location where the resource exists. | string | - | yes |
| location_short | Short version of the Azure location, used by naming convention. | string | - | yes |
| resource_group_name | The name of the resource group in which the VM has been created. | string | - | yes |
| stack | Project stack name | string | - | yes |
| vm_ids | List of Azure VM ID to attach to the Backup policy | list | - | yes |

## Related documentation

~~[Enable backup protection via Azure CLI](https://github.com/MicrosoftDocs/azure-docs/blob/master/articles/backup/quick-backup-vm-cli.md)~~

[Enable backup protection via Terraform](https://www.terraform.io/docs/providers/azurerm/r/recovery_services_protection_policy_vm.html)
