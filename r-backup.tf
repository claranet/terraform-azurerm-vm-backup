resource "null_resource" "recovery_vault_backup_enable" {
  triggers {
    uuid = "${var.azure_short_region}${var.vm_id}${var.stack}"
  }

  # Based on https://github.com/MicrosoftDocs/azure-docs/blob/master/articles/backup/quick-backup-vm-cli.md
  provisioner "local-exec" {
    command = <<CMD
az backup protection enable-for-vm \
    --resource-group "${var.resource_group_name}" \
    --vault-name "${var.backup_recovery_vault}" \
    --vm "${var.vm_id}" \
    --policy-name "${var.backup_policy_name}"
CMD
  }

  provisioner "local-exec" {
    when = "destroy"

    command = <<CMD
az backup protection disable \
    --resource-group "${var.resource_group_name}" \
    --vault-name "${var.backup_recovery_vault}" \
    --container-name "${var.vm_name}" \
    --item-name "${var.vm_name}" \
    --delete-backup-data "${var.delete_backup_data_on_destroy}" \
    --yes
CMD
  }
}
