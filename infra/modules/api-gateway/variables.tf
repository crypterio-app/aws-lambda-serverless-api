
variable "api_name" {
  description = "The name of the API Gateway REST API"
  type        = string
}

variable "api_description" {
  description = "The description of the API Gateway REST API"
  type        = string
  default     = "REST API with Lambda proxy integration"
}

variable "stage_name" {
  description = "The name of the API Gateway stage"
  type        = string
  default     = "prod"
}

variable "lambda_invoke_arn" {
  description = "The ARN to be used for invoking Lambda Function from API Gateway"
  type        = string
}

variable "lambda_function_name" {
  description = "The name of the Lambda function"
  type        = string
}
