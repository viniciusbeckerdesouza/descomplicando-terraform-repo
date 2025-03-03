## State
O arquivo de State serve para mapear o mundo real. Tudo que está neste arquivo existe no mundo real.
Os blocos do terraform precisam estar persistidos.
O state faz um mapeamento entre o que está na cloud e o que está no seu código.
O state mantém metadados que são aproveitados em diversas necessidades.
Um exemplo, se eu removo o resource do meu HCL e rodo um plan, o state vai olhar nos metadados e verificar que o HCL foi alterado. No plano ele vai flar que o recurso que está na cloud será destruído, porque se ele não existe no código também não deve existir no mundo real.
O state garante a integridade. Toda a infra tem que estar controlada pelo terraform.
Ao contrário, o ansible não é assim. Quando você tira um recurso do playbook, o ansible para de controlar aquele recurso, mas ele não deixa de existir.
O state também garante mais performance, já que o terraform só vai executar o que tiver sido alterado.
O state garante syncing, ou seja, várias pessoas podem trabalhar em cima do mesmo state com ele remoto.
### Comandos
```
terraform state <comando>
```

- list: lista tudo que está no state
- show: mostra os atributes de um recurso (precisa passar o atributo)
- pull: retorna o json do state. Pode ser redirecionado para uma arquivo .json usando jq
- push: não usar
### Lock do state
Quando você coloca o state remoto, várias pessoas podem trabalhar nele ao mesmo tempo. Ou seja, pode ter 2 ou mais pessoas fazendo modificações ao mesmo tempo, e gerando conflitos.
Por isso, ao salvar no s3, o bucket é o mesmo, mas tem múltiplas keys.
Antes de você fazer a edição, você deve bloquear o state para que mais ninguém consiga mexer.
[DynamoDB] (https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_table): banco não relacional da AWS. 
