// ========= Global variables
variable "client_name" {
  description = "Client name/account used in naming"
}

variable "environment" {
  description = "Project environment"
}

variable "stack" {
  description = "Project stack name"
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the PostgreSQL Server. Changing this forces a new resource to be created."
}

variable "azure_region" {
  description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
}

variable "azure_short_region" {
  description = "Short version of the Azure location, used by naming convention."
}

// ========= VM variables
variable "vm_name" {
  description ="Azure VM name to attach the Backup policy"
}

variable "vm_id" {
  description ="Azure VM ID to attach the Backup policy"
}

// ========= Backup variables
variable "backup_recovery_vault" {
  description ="Backup recovery vault name"
}

variable "backup_policy_name" {
  description ="Backup policy name to attach"
}
