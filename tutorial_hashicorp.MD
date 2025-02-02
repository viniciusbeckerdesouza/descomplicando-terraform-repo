## Tutorial Hashicorp AWS

Disponível em: https://developer.hashicorp.com/terraform/tutorials/aws-get-started <https://developer.hashicorp.com/terraform/tutorials/aws-get-started>

O que é Infraestrtura como código (IaC)?
Forma de gerenciar infraestrutura usando arquivos de configuração. Palavras-chave: seguro, consistente, repetível, reutilizável, versionável, compartilhável.

Como deployar infraestrutura com terraform?
Escopo -> Autor -> Init -> Plan -> Apply

### Build Infra
```
export AWS_ACCESS_KEY_ID=
export AWS_SECRET_ACCESS_KEY=
mkdir learn-terraform-aws-instance
cd learn-terraform-aws-instance
touch main.tf
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-west-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}
terraform init
terraform fmt
terraform validate
terraform apply
terraform show
terraform state list
```