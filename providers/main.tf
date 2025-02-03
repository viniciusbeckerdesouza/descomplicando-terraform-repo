terraform {
  backend "s3" {
    bucket = "descomplicando-terraform-vinicius-becker"
    key    = "aula_backend2"
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
  alias  = "west"
  region = "us-west-2"
}

provider "aws" {
  alias  = "east"
  region = "us-east-2"
}

provider "aws" {
  alias  = "sp"
  region = "sa-east-1"
}

resource "aws_instance" "east" {
  ami           = "ami-08d70e59c07c61a3a"
  instance_type = "t3.micro"
  provider      = aws.east  # Correção aqui

  tags = {
    Name = "East"
  }
}

resource "aws_instance" "sp" {
  ami           = "ami-08d70e59c07c61a3a"
  instance_type = "t3.micro"
  provider      = aws.sp  # Correção aqui

  tags = {
    Name = "SP"
  }
}
