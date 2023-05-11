remote_state {
  backend = "s3"
  config = {
    region  = "ap-northeast-1"
    bucket  = "tk-test-terraform02"
    key     = "terraform.tfstate"
  }
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "aws" {
  region  = "ap-northeast-1"
}
EOF
}
