variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region to use"
  type        = string
}

variable "location_short" {
  description = "Short string for Azure location"
  type        = string
}

variable "environment" {
  description = "Project environment"
  type        = string
}

variable "stack" {
  description = "Project stack name"
  type        = string
}

variable "client_name" {
  description = "Client name/account used in naming"
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
