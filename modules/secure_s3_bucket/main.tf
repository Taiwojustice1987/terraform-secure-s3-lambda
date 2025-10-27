# modules/secure_s3_bucket/main.tf

# S3 Bucket
resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name

  # Enable server-side encryption using KMS
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "aws:kms"
        kms_master_key_id = var.kms_key_id
      }
    }
  }

  # Enable server access logging
  logging {
    target_bucket = var.logging_bucket
    target_prefix = "access-logs/"
  }

  # Tags
  tags = {
    Name        = var.bucket_name
    Environment = "Dev"
  }
}

# Separate resource for versioning (deprecated inline versioning removed)
resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id

  versioning_configuration {
    status = "Enabled"
  }
}

# Optional: ACL if you still want to manage bucket ACLs
# resource "aws_s3_bucket_acl" "this" {
#   bucket = aws_s3_bucket.this.id
#   acl    = "private"
# }
