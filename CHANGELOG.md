# Unreleased

Changed
  * AZ-572: Revamp examples and improve CI

# v4.0.1 - 2021-08-27

Updated
  * AZ-532: Revamp README with latest `terraform-docs` tool

# v4.0.0 - 2021-01-19

Breaking
  * AZ-344: Back to a single resource, because we can now use `for_each` on a module since Terraform `v0.13+`

Updated
  * AZ-273: Module now compatible terraform `v0.13+`

# v3.0.0 - 2020-07-03

Breaking
  * AZ-198: Upgrade resources to be compatible with AzureRM 2.0

# v2.0.1 - 2020-07-03

Changed
  * AZ-206: Pin version AzureRM under 2.0 to be usable + add variables types

# v2.0.0 - 2019-10-07

Breaking
  * AZ-94: Terraform 0.12 / HCL2 format

Added
  * AZ-118: Add LICENSE, NOTICE & Github badges
  * AZ-119: Add CONTRIBUTING.md doc and `terraform-wrapper` usage with the module

Changed
  * AZ-119: Revamp README and publish this module to Terraform registry

# v0.3.0 - 2019-07-05

Changed:
  * AZ-29: Change type for `vm_id` to list

# v0.2.1 - 2019-04-29

Fixed:
  * AZ-29: Remove buggy `tags` variable

# v0.2.0 - 2019-04-01

Changed:
  * AZ-29: Use native `azurerm_recovery_services_protected_vm` Terraform resource.

# v0.1.0 - 2019-02-12

Added:
  * AZ-4-29: First Release. Azure VM Backup attachment - via Azure CLI.
