# Azure VM - Enable backup

Because for now this feature isn't available in the AzureRM Terraform provider, we're using `az cli` to enable backup.
If you destroy this module, the backup protection will be removed on the targeted Azure VM.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| backup_policy_name | Backup policy name to attach | string | - | yes |
| backup_recovery_vault_name | Backup recovery vault name | string | - | yes |
| client_name | Client name/account used in resource naming | string | - | yes |
| delete_backup_data_on_destroy | Delete all backup data when disabling backup on the targeted VM. | string | `true` | no |
| environment | Project environment | string | - | yes |
| location | Specifies the supported Azure location where the resource exists. | string | - | yes |
| location_short | Short version of the Azure location, used by naming convention. | string | - | yes |
| resource_group_name | The name of the resource group in which the VM has been created. | string | - | yes |
| stack | Project stack name | string | - | yes |
| vm_id | Azure VM ID to attach the Backup policy | string | - | yes |
| vm_name | Azure VM name to attach the Backup policy | string | - | yes |

## Related documentation

[Enable backup protection via Azure CLI](https://github.com/MicrosoftDocs/azure-docs/blob/master/articles/backup/quick-backup-vm-cli.md)
