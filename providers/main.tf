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

resource "aws_instance" "web" {
  ami           = "ami-08d70e59c07c61a3a"
  instance_type = "t3.micro"
  provider = aws.east
  tags = {
    Name = "East"
  }
}
resource "aws_instance" "web" {
  ami           = "ami-08d70e59c07c61a3a"
  instance_type = "t3.micro"
  provider = aws.sp
  tags = {
    Name = "SP"
  }
}