resource "azurerm_recovery_services_protected_vm" "recovery_vault_backup_enable" {
  count = "${length(var.vm_ids)}"

  resource_group_name = "${var.resource_group_name}"
  recovery_vault_name = "${var.backup_recovery_vault_name}"
  source_vm_id        = "${element(var.vm_ids, count.index)}"
  backup_policy_id    = "${var.backup_policy_id}"
}
