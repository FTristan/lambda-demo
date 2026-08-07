provider "aws" {
  region = "us-east-1"
}

data "archive_file" "lambda_zip" {
  type        = "zip"
  source_file = "../lambda_function.py"
  output_path = "../lambda.zip"
}
