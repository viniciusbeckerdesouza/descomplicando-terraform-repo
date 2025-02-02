## O que é HCL?

HCL é o formato do arquivo de configuração usado pelo Terraform.  
O Terraform também entende JSON.  

### Elementos do HCL:

#### Blocos

O bloco é composto por:
1. type: por exemplo, resource
2. labels: são 2 - primeiro o sub-tipo do que você vai criar; segundo um nome para o que você está criando
Exemplo:  
```
resource "aws_instance" "app_server" {
  ami           = "ami-08d70e59c07c61a3a"
  instance_type = "t2.micro"
}
```
Neste exemplo, o type é *resource*, o tipo do resource é *aws_instance* e o nome é *app_server*.  
Para encontrar os tipos de resource disponíveis para cada provider, só consultar <https://registry.terraform.io>  


#### Argumentos
Tudo o que está dentro das chaves do bloco.  
São conjuntos chave-valor.  
Descrevem o que o terraform deve fazer.  
Exemplo:  
```
resource "aws_instance" "app_server" {
  ami           = "ami-08d70e59c07c61a3a"
  instance_type = "t2.micro"
}
```
Neste exemplo, *ami* é um argumento que descreve qual imagem  será usada. *instance_type* é outro argumento que descrve o tamanho da máquina EC2 a ser criada.  
Pode ser string (entre aspas), lista (entre colchetes) e outros.  
#### Identificadores
Em vez de uma string, se passa uma var ou um data e seu atributo (a saída do data ou do var).  
Exemplo:
```
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}
```
Neste exemplo o argumento do ami é passado usando um identificador.  
#### Comentários
Começa com "#". Múltiplas linhas faz com "/*" */".  