resource "azurerm_recovery_services_protected_vm" "recovery_vault_backup_enable" {
  resource_group_name = "${var.resource_group_name}"
  recovery_vault_name = "${var.backup_recovery_vault_name}"
  source_vm_id        = "${var.vm_id}"
  backup_policy_id    = "${var.backup_policy_id}"

  tags = "${var.tags}"
}
