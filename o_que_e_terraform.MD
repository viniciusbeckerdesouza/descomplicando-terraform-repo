## O que é Terraform?

Terraform é um binário.  
HCL é o formato do arquivo de configuração.  
Terraform é descritivo: você descreve que a imagem será criada de acordo com certas especificações.  
State File guarda as informações do que já foi criado.  
Assim, o terraform verifica o que está no HCL; compara com o que está no state file; e cria, deleta ou muda a imagem.  

### Casos de uso do Terraform

- Multicloud
- Infraestrutura escalável com monitoramento
- Cluster self service

### Tipos de infraestrutura

- Imutável: quando precisa substituir uma aplicação por outra, você cria uma nova máquina e migra os workflows para ela. Sempre que você precisa modificar alguma coisa, você cria uma nova máquina com as novas definições. **Problema**: complexo de implementar, aí que entra o Terraform.
- Mutável: quando você modifica a aplicação que roda em uma determinada máquina ou outras configs. Por exemplo, na máquina xpto0123 estava rodando spark; ela foi descomissionada e agora está rodando kafka. **Problema**: como o servidor está é uma incógnita, pode ter o mesmo serviço rodando em diferentes hosts, mas cada máquina configurada de um jeito.


