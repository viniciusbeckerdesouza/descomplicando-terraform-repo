## Providers

Providers são os plugins para conectar na cloud.  
É obrigatório indicar o provider a ser usado no HCL.  
Onde encontrar? No Terraform Registry.  
Os providers são instalados sempre que executamos o *init*.  
Você pode usar alias para identificar providers diferentes mas que são da mesma empresa:
```
provider "aws" {
    alias = "west"
    region = "us-west-2"
}
provider "aws" {
    alias = "east"
    region = "us-east-2"
}
```
