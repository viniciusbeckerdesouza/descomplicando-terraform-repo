terraform {
  backend "s3" {
    bucket = "descomplicando-terraform-vinicius-becker"
    key    = "aula_dynamodb"
    region = "us-west-2"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}