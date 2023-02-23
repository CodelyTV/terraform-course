resource "aws_dynamodb_table" "apps_storage" {
  name           = "${var.env}-${var.dynamodb_name}"
  billing_mode   = "PROVISIONED"
  read_capacity  = var.read_capacity
  write_capacity = var.write_capacity
  hash_key       = "ImageId"
  range_key      = "LastUpdatedTime"
}