## O que é HCL?

HCL é o formato do arquivo de configuração usado pelo Terraform.  
O Terraform também entende JSON.  

### Elementos do HCL:

#### Blocos

Começa e termina com chaves "{}".  
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
