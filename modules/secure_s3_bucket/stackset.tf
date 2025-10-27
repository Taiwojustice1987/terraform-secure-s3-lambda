resource "aws_cloudformation_stack_set" "secure_s3_stackset" {
  name = var.stackset_name

  template_body = file("${path.module}/secure-s3-lambda.yml")

  capabilities = ["CAPABILITY_NAMED_IAM"]

  parameters = {
    BucketName              = var.bucket_name
    LambdaExecutionRoleName = var.lambda_role_name
  }

  administration_role_arn = "arn:aws:iam::626635400294:role/AWSCloudFormationStackSetAdministrationRole"
  execution_role_name     = "AWSCloudFormationStackSetExecutionRole"
}
