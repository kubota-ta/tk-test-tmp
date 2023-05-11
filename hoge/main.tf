terraform {
  required_version = "~> 1.4.4"
  backend "s3" {
    # your own s3 bucket
    bucket = "tk-test-terraform02"
    region = "ap-northeast-1"
    key    = "terraform.tfstate"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

resource "aws_vpc" "main" {
  cidr_block           = "172.32.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "created-by-terraform"
  }
}
