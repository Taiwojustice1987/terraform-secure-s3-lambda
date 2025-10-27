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

terraform-secure-s3-lambda/
├── main.tf # Root Terraform configuration
├── variables.tf # Input variables
├── outputs.tf # Output values
├── modules/
│ ├── lambda_iam_role/ # Module to create IAM role for Lambda
│ │ ├── main.tf
│ │ ├── outputs.tf
│ └── secure_s3_bucket/ # Module to create secure S3 bucket
│ ├── main.tf
│ ├── outputs.tf
│ ├── variables.tf
│ └── secure-s3-lambda.yml
├── .gitignore # Git ignore file
└── README.md



---

## Prerequisites
- Terraform >= 1.5
- AWS CLI configured with credentials for the target accounts
- IAM permissions to create S3 buckets, IAM roles, and related resources

---

## Deployment Steps

1. **Initialize Terraform**
```bash
terraform init

Security Considerations

.terraform directory and terraform.tfstate files are excluded from GitHub using .gitignore to prevent sensitive information leaks

KMS keys used for encryption are managed per AWS best practices

IAM roles follow the principle of least privilege
