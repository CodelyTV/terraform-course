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