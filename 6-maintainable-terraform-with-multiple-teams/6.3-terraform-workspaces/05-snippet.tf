resource "aws_s3_bucket" "example" {
  count = terraform.workspace == "default" ? 5 : 1

  # ... other arguments
}
