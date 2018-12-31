# Azure VM - Enable backup

Because for now this feature isn't available in the AzureRM Terraform provider, we're using `az cli` to enable backup.
If you destroy this module, the backup protection will be removed on the targeted Azure VM.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| azure_region | Specifies the supported Azure location where the resource exists. | string | - | yes |
| azure_short_region | Short version of the Azure location, used by naming convention. | string | - | yes |
| backup_policy_name | Backup policy name to attach | string | - | yes |
| backup_recovery_vault | Backup recovery vault name | string | - | yes |
| client_name | Client name/account used in resource naming | string | - | yes |
| delete_backup_data_on_destroy | Delete all backup data when disabling backup on the targeted VM. | boolean | `true` | no |
| environment | Project environment | string | - | yes |
| resource_group_name | The name of the resource group in which the VM has been created. | string | - | yes |
| stack | Project stack name | string | - | yes |
| vm_id | Azure VM ID to attach the Backup policy | string | - | yes |
| vm_name | Azure VM name to attach the Backup policy | string | - | yes |
