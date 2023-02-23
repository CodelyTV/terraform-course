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