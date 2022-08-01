terraform {
  backend "s3" {
    bucket = "c360-state-files"
    key    = "c360.tfstate"
    region = "us-west-2"
  }

  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}
provider "aws" {
  region              = var.aws-region
  allowed_account_ids = [641312770660]
}
