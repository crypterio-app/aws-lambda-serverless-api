
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "REPLACE_WITH_YOUR_BUCKET_NAME"
    key    = "serverless-api/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}

locals {
  environment = "serverless-api"
  aws_region  = "us-east-1"
}

module "dynamodb_table" {
  source = "../../modules/dynamodb-table"

  table_name   = "${local.environment}-items"
  hash_key     = "id"
  billing_mode = "PAY_PER_REQUEST"
}

module "lambda_api" {
  source = "../../modules/lambda-api"

  function_name       = "${local.environment}-function"
  handler             = "index.handler"
  runtime             = "nodejs20.x"
  dynamodb_table_arn  = module.dynamodb_table.table_arn

  environment_vars = {
    TABLE_NAME = module.dynamodb_table.table_name
    REGION     = local.aws_region
  }
}

module "api_gateway" {
  source = "../../modules/api-gateway"

  api_name             = "${local.environment}-api"
  api_description      = "Serverless REST API with Lambda and DynamoDB"
  stage_name           = "prod"
  lambda_invoke_arn    = module.lambda_api.invoke_arn
  lambda_function_name = module.lambda_api.function_name
}
