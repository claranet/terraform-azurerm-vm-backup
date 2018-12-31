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

variable "azure_region" {
  description = "Specifies the supported Azure location where the resource exists."
}

variable "azure_short_region" {
  description = "Short version of the Azure location, used by naming convention."
}

// ========= VM variables
variable "vm_name" {
  description = "Azure VM name to attach the Backup policy"
}

variable "vm_id" {
  description = "Azure VM ID to attach the Backup policy"
}

// ========= Backup variables
variable "backup_recovery_vault" {
  description = "Backup recovery vault name"
}

variable "backup_policy_name" {
  description = "Backup policy name to attach"
}

variable "delete_backup_data_on_destroy" {
  description = "Delete all backup data when disabling backup on the targeted VM."
  default     = true
}
