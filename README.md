# Terraform Secure S3 Bucket and Lambda IAM Role
## Project Overview
This Terraform project automates the creation of **secure S3 buckets** and **IAM roles for Lambda functions** across multiple AWS accounts. It ensures that all necessary security controls are applied and enables secure, automated operations.

**Key Features:**
- Creates S3 buckets with:
  - Server-Side Encryption (SSE-KMS)
  - Public Access Block
  - Versioning
  - Logging
- Creates IAM roles with trust policies for Lambda functions to assume
- Supports deployment across multiple AWS accounts and regions
- Infrastructure as Code (IaC) fully implemented using Terraform

---

## Project Structure
