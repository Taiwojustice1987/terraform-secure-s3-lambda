output "lambda_role_name" {
  description = "Name of the Lambda IAM Role"
  value       = aws_iam_role.lambda_role.name
}
