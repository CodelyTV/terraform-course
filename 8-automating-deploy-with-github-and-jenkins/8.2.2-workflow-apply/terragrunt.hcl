terraform {
  extra_arguments "common_vars" {
    commands = get_terraform_commands_that_need_vars()

    optional_var_files = [
      "${find_in_parent_folders("env.tfvars", "skip-env-if-does-not-exist")}"
    ]
  }
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
# This file is managed by `terragrunt.hcl` file from the root folder.
# Any changes here will be lost.
# Default provider Ireland
provider "aws" {
  region = "eu-west-1"
}
# AWS Virginia provider
provider "aws" {
  alias  = "mango-test-virginia"
  region = "us-east-1"
}
EOF
}

remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket         = "codely-tf-states"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "eu-west-1"
    encrypt        = true
    dynamodb_table = "codely-tf-state"
  }
}