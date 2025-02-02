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
```
Conteúdo do main.tf:
```
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
```
```
terraform init
terraform fmt
terraform validate
terraform apply
terraform show
terraform state list
```

### Variables
```
variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "ExampleAppServerInstance"
}
```

### Outputs

```
output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.app_server.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.app_server.public_ip
}
```
