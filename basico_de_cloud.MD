## Como funciona a Cloud

Cloud é uma empresa que vende recursos / máquinas.  
O que faz diferença é a existência de uma API, que consegue se comunicar com todos os serviços. O Terraform vai se comunicar com a API para executar solicitações, alterações e remoção.  
EC2: máquinas ou instâncias.  
S3: armazenamento. O state file deve ser armazenado aqui. 
Regiões: local geográfico onde vai implantar sua instância.  
Zonas: como se fosse um datacenter, localização mais específica.  
IAM: controle de acesso, define quem vai poder usar a API.  
