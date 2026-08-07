resource "aws_lambda_function" "hello_lambda" {
  function_name = "hello-from-fernando"

  filename         = data.archive_file.lambda_zip.output_path
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256

  role = aws_iam_role.lambda_role.arn

  runtime = "python3.13"
  handler = "lambda_function.lambda_handler"

  timeout = 10

  depends_on = [
    aws_iam_role_policy_attachment.lambda_logs
  ]
}

resource "aws_lambda_function_url" "hello_url" {
  function_name      = aws_lambda_function.hello_lambda.function_name
  authorization_type = "NONE"
}

output "lambda_url" {
  value = aws_lambda_function_url.hello_url.function_url
}
