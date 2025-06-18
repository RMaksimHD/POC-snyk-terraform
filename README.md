# POC-snyk-terraform
# Example of Using Snyk Exceptions for Terraform

This repository demonstrates how to use Snyk exceptions for Terraform configurations. It shows how to manually create a `.snyk` file to ignore detected vulnerabilities.

---

## Goal

The goal of this repository is to showcase how to manually add exceptions in Snyk for Terraform configurations and manage false positives while maintaining control over the security of your infrastructure.

---

## Repository Contents

1. **Terraform File (`terraform/storage.tf`)**:
   - Describes the creation of an Azure Storage Account resource.
   - A basic configuration for demonstration purposes.

2. **Snyk Exceptions File (`.snyk`)**:
   - Manually added to ignore two vulnerabilities detected during Terraform configuration scanning.

---

## Adding Snyk Exceptions

The `.snyk` file was manually created to ignore the following vulnerabilities:

1. **SNYK-CC-TF-149**:
   - Issue related to the `min_tls_version` parameter in the `azurerm_storage_account` resource.
   - The exception is configured specifically for this resource.

2. **SNYK-CC-AZURE-649**:
   - A general vulnerability related to Azure.
   - The exception is configured globally for all occurrences.

### Example of `.snyk` File Structure

```yaml
ignore:
  SNYK-CC-TF-149:
    - 'terraform/storage.tf > resource > azurerm_storage_account[this] > min_tls_version':
        reason: Attribute is invalid
        expires: 2025-10-11T10:00:00.000Z
  SNYK-CC-AZURE-649:
    - '*':
        reason: Fine to ignore for demo
        created: 2025-06-18T10:00:00.000Z