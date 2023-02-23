inputs = {
    env = substr(path_relative_to_include(), -3, -1)
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

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
# This file is managed by `terragrunt.hcl` file from the root folder.
# Any changes here will be lost.
# Default provider
provider "aws" {
  region = "eu-west-1"
}

provider "aws" {
  alias  = "mango-test-virginia"
  region = "us-east-1"
}
EOF
}