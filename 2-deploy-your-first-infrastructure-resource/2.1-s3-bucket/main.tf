resource "aws_s3_bucket" "example_bucket" {
  bucket = var.bucket_name

  tags = {
    Environment = "Dev"
    Project     = "Codely course"
  }
}