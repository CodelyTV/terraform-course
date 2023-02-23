locals {
  whitelist_cidr = ["0.0.0.0/0"]
}

resource "aws_s3_bucket" "example_bucket" {
  bucket = var.bucket_name

  tags = {
    Environment = "Dev"
    Project     = "Codely course"
  }
}

resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.example_bucket.id
  key    = "hello-world"
  source = "hello-world.html"

  content_type = "text/html"
}

resource "aws_s3_bucket_policy" "main" {
  bucket = aws_s3_bucket.example_bucket.id
  policy = data.aws_iam_policy_document.main.json
}

data "aws_iam_policy_document" "main" {

  statement {
    effect = "Allow"
    actions = [
      "s3:GetObject"
    ]
    resources = [
      "${aws_s3_bucket.example_bucket.arn}/*"
    ]
    condition {
      variable = "aws:sourceIp"
      test     = "IpAddress"
      values   = local.whitelist_cidr #Restrict to your IP"
    }
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
  }
}