## Comandos básicos

### init
Cria a pasta .terraform. Nesta pasta vai ter tudo que o binário precisa pra rodar.
Nela vai baixar os plugins, vai colocar os módulos etc.  
Usar *-upgrade* sempre pra atualizar os plugins.  

### plan
Este comando olha o HCL para ver o que você quer, olha o state file e verifica se o que foi pedido bate com o state e com o que está na cloud.  
Se já tiver a máquina, ele vai falar que não tem nada para criar. Se não tiver ou for diferente, ele vai retornar as etapas que serão executadas.  
Precisa fazer o export das credenciais primeiro.  
Usar opção *-out* para salvar o plano em um arquivo.  

### apply
Este comando aplica o plano, se existir, ou apenas cria a infraestrtura diretamente.  
Para usar o apply com um plano já criado, você passa o nome do arquivo.  
```
terraform apply <nome-do-plano>
```

### destroy
Sempre rode ao fim do dia durante o treinamento.  
Este comando deleta a infraestrtura que está no state file.  
Pode-se fazer um plano pro destroy:
```
terraform plan -destroy <nome-do-plano>
terraform apply <nome-do-plano>
```
Neste caso, se usa o apply para executar o plano de destroy.  


