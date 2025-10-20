
output "api_endpoint" {
  description = "The URL to invoke the API pointing to the stage"
  value       = aws_api_gateway_stage.stage.invoke_url
}

output "api_id" {
  description = "The ID of the REST API"
  value       = aws_api_gateway_rest_api.api.id
}

output "api_arn" {
  description = "The ARN of the REST API"
  value       = aws_api_gateway_rest_api.api.arn
}
