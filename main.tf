terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  required_version = ">= 1.5.0"
}

provider "aws" {
  region = var.aws_region
}

# KMS key for encryption
resource "aws_kms_key" "s3_encryption" {
  description             = "KMS key for S3 bucket encryption"
  deletion_window_in_days = 10
  enable_key_rotation     = true
}

# Logging bucket
resource "aws_s3_bucket" "logging" {
  bucket        = "${var.project_name}-logs"
  force_destroy = true
}

# Secure S3 bucket module
module "secure_s3_bucket" {
  source         = "./modules/secure_s3_bucket"
  bucket_name    = "${var.project_name}-secure-bucket"
  kms_key_id     = aws_kms_key.s3_encryption.id
  logging_bucket = aws_s3_bucket.logging.id
}

# Lambda IAM role module
module "lambda_iam_role" {
  source = "./modules/lambda_iam_role"
}
