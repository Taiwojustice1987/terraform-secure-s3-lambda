variable "bucket_name" {
  description = "S3 bucket name"
  type        = string
  default     = "secure-s3-lambda-secure-bucket"
}

variable "kms_key_id" {
  description = "KMS key ID for encryption"
  type        = string
  default     = "b8babe04-f522-4f09-a5b8-372d097b4e58"
}

variable "logging_bucket" {
  description = "S3 bucket used for logging"
  type        = string
  default     = "secure-s3-lambda-logs"
}

variable "lambda_role_name" {
  description = "Name of the Lambda IAM Role"
  type        = string
  default     = "lambda_s3_secure_role"
}

variable "stackset_name" {
  description = "Name of the CloudFormation StackSet"
  type        = string
  default     = "secure-s3-lambda-stackset"
}
