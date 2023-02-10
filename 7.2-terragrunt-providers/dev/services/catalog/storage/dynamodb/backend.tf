terraform {
  backend "s3" {
    bucket         = "codely-tf-states"
    key            = "dev/services/catalog/storage/dynamodb/terraform.tfstate"
    region         = "eu-west-1"
    encrypt        = true
    dynamodb_table = "codely-tf-state"
  }
}