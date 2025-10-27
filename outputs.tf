output "s3_bucket_name" {
  value = module.secure_s3_bucket.bucket_name
}

output "lambda_role_name" {
  value = module.lambda_iam_role.lambda_role_name
}

output "kms_key_id" {
  value = aws_kms_key.s3_encryption.id
}
