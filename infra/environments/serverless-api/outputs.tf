
output "api_url" {
  description = "The URL to invoke the API"
  value       = module.api_gateway.api_endpoint
}

output "dynamodb_table_name" {
  description = "The name of the DynamoDB table"
  value       = module.dynamodb_table.table_name
}

output "lambda_function_name" {
  description = "The name of the Lambda function"
  value       = module.lambda_api.function_name
}

output "lambda_function_arn" {
  description = "The ARN of the Lambda function"
  value       = module.lambda_api.function_arn
}
