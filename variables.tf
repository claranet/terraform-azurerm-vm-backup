variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "vm_id" {
  description = "Azure VM ID to attach to the Backup policy"
  type        = string
}

variable "backup_recovery_vault_name" {
  description = "Backup recovery vault name"
  type        = string
}

variable "backup_policy_id" {
  description = "Backup policy to attach"
  type        = string
}
