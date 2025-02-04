## Variables

As variáveis servem para passar valores para os argumentos nos blocos do HCL.  
O bloco de variáveis começa com *variable* e o tipo da variável.
Exemplo:
```
variable "image_id" {
  type = string
}
```
### Como usar a variável?
1. Via linha de comando:
Usando *-var* após o apply ou plan.
```
terraform apply -var="image_id=ami-abc123"
```
2. No código:
Passa o *var.<tipo-da-variavel>* como valor no argumento correspondente.
Exemplo:
```
resource "aws_instance" "web"{
    ami = var.image_id
}
```
### Argumentos
- default: valor padrão que será usado para aquela variável
