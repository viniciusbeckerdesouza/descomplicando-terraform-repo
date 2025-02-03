## Comandos básicos

### init
Cria a pasta .terraform. Nesta pasta vai ter tudo que o binário precisa pra rodar.
Nela vai baixar os plugins, vai colocar os módulos etc.  

### plan
Este comando olha o HCL para ver o que você quer, olha o state file e verifica se o que foi pedido bate com o state e com o que está na cloud.  
Se já tiver a máquina, ele vai falar que não tem nada para criar. Se não tiver ou for diferente, ele vai retornar as etapas que serão executadas.  

### apply
Este comando aplica o plano, se existir, ou apenas cria a infraestrtura diretamente.  

### destroy
Sempre rode ao fim do dia durante o treinamento.  
Este comando deleta a infraestrtura que está no state file.  

