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
