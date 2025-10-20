
variable "function_name" {
  description = "The name of the Lambda function"
  type        = string
}

variable "handler" {
  description = "The function entry point in your code"
  type        = string
}

variable "runtime" {
  description = "The identifier of the function's runtime"
  type        = string
}

variable "environment_vars" {
  description = "Map of environment variables available to the Lambda function"
  type        = map(string)
  default     = {}
}

variable "dynamodb_table_arn" {
  description = "The ARN of the DynamoDB table for access permissions"
  type        = string
}
