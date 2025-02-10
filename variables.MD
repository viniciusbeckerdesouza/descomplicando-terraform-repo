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
3. Como variável de ambiente
A variável precisa ser exportada no seguinte formato:
*TF_VAR_image_id=ami-abc123*, sempre começando com "TF_VAR_".
```
export TF_VAR_image_id=ami-abc123
```
Depois é só executar o plan ou apply. O Terraform vai entender que a variável está no ambiente.
Nota: para ver todas as variáveis de ambiente, só usar *env*. Para tirar uma variável do ambiente usar *unset*.

### Argumentos
- default: valor padrão que será usado para aquela variável. Não deve ser usado se você quer que o usuário especifique.  
- type: serve para garantir que o tipo passado é o correto. Se tanto faz o tipo, pode usar "any".  Se tiver como "string" ele vai trasformar tudo o que você passar para string.  
- description: serve para documentar a variável.  O Terraform docs usa para criar documentação de forma automatizada.  
- validation: serve para fazer um teste condicional para validar que o valor passado para a variável está correto. 
Exemplo:
```
variable "image_id" {
  type        = string
  description = "The id of the machine image (AMI) to use for the server."

  validation {
    condition     = length(var.image_id) > 4 && substr(var.image_id, 0, 4) == "ami-"
    error_message = "The image_id value must be a valid AMI id, starting with \"ami-\"."
  }
}
```
Neste exemplo, a condição é que o valor passado tenha mais de 4 caracteres e comece com "ami-". 
- sensitive: muitas informações passadas causam riscos para a organização e por isso devem ser criptografadas.  
### Arquivo tfvars
Para melhor organizar os valores de variáveis, pode-se criar um arquivo .tfvars e declarar os valores das variáveis nele. Exemplo de execução:
```
terraform apply -var-file="testing.tfvars"
```
### Precedência
O Terraform usa as variáveis de acordo com a seguinte precedência (do menos importante para o mais importante):
- variável de ambiente
- .tfvars
- .tfvars.json
- .auto.tfvars ou .auto.tfvars.json (neste casos, ele processa na ordem alfabética do nome do arquivo)
- -var e -var-file (na ordem em que for passado na linha de comando)
