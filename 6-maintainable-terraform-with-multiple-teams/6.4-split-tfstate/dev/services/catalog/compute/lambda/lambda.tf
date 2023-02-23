resource "aws_lambda_function" "catalog-writer" {
  # If the file is not in the current working directory you will need to include a
  # path.module in the filename.
  filename      = "catalog-writer.zip"
  function_name = "catalog-writer"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "code.lambda_handler"

  source_code_hash = filebase64sha256("catalog-writer.zip")

  runtime = "python3.9"
}

// get dynamodb ARN from name
data "aws_dynamodb_table" "tableName" {
  name = var.dynamodb_name
}

// dynamodb table Write Policy
data "aws_iam_policy_document" "inline_policy" {
  statement {
    actions = [
      "dynamodb:DeleteItem",
      "dynamodb:DescribeTable",
      "dynamodb:GetItem",
      "dynamodb:GetRecords",
      "dynamodb:ListTables",
      "dynamodb:PutItem",
      "dynamodb:Query",
      "dynamodb:Scan",
      "dynamodb:UpdateItem",
      "dynamodb:UpdateTable",
    ]

    resources = [data.aws_dynamodb_table.tableName.arn]

    effect = "Allow"
  }
}

// IAM role used by lambda function
resource "aws_iam_role" "iam_for_lambda" {
  name = "lambda-role"

  inline_policy {
    name   = "policy-dynamodb-writer"
    policy = data.aws_iam_policy_document.inline_policy.json
  }

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow"
    }
  ]
}
EOF
}

// Lambda permissions invoke function from S3
resource "aws_lambda_permission" "allow_bucket" {
  statement_id  = "AllowExecutionFromS3Bucket"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.catalog-writer.arn
  principal     = "s3.amazonaws.com"
  source_arn    = "arn:aws:s3:::${var.bucket_name}"
}

// tfstate output
output "lambda_arn" {
  value = aws_lambda_function.catalog-writer.arn
}