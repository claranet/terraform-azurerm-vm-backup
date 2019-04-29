// ========= Global variables
variable "client_name" {
  description = "Client name/account used in resource naming"
}

variable "environment" {
  description = "Project environment"
}

variable "stack" {
  description = "Project stack name"
}

variable "resource_group_name" {
  description = "The name of the resource group in which the VM has been created."
}

variable "location" {
  description = "Specifies the supported Azure location where the resource exists."
}

variable "location_short" {
  description = "Short version of the Azure location, used by naming convention."
}

// ========= VM variables

variable "vm_id" {
  description = "Azure VM ID to attach the Backup policy"
}

// ========= Backup variables
variable "backup_recovery_vault_name" {
  description = "Backup recovery vault name"
}

variable "backup_policy_id" {
  description = "Backup policy to attach"
}
