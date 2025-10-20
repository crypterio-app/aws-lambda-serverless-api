
variable "table_name" {
  description = "The name of the DynamoDB table"
  type        = string
}

variable "hash_key" {
  description = "The attribute to use as the hash (partition) key"
  type        = string
}

variable "billing_mode" {
  description = "Controls how you are charged for read and write throughput. Valid values are PROVISIONED and PAY_PER_REQUEST"
  type        = string
  default     = "PAY_PER_REQUEST"
}
