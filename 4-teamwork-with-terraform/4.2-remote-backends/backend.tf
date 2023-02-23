terraform {
  backend "s3" {
    bucket = "codely-tf-states"
    key    = "apps/terraform.tfstate"
    region = "eu-west-1"
  }
}