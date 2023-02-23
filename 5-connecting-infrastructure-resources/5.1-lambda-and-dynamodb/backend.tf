terraform {
  backend "s3" {
    bucket         = "codely-tf-states"
    key            = "apps/terraform.tfstate"
    region         = "eu-west-1"
    encrypt        = true
    dynamodb_table = "codely-tf-state"
  }
}