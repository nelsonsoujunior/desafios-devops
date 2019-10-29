# Desafio 01: Infrastructure-as-code - Terraform

## Motivação

Recursos de infraestrutura em nubvem devem sempre ser criados utilizando gerenciadores de configuração, tais como [Cloudformation](https://aws.amazon.com/cloudformation/), [Terraform](https://www.terraform.io/) ou [Ansible](https://www.ansible.com/), garantindo que todo recurso possa ser versionado e recriado de forma facilitada.

## Objetivo

- Criar uma instância **n1-standard-1** (GCP) ou **t2.micro** (AWS) Linux utilizando **Terraform**.
- A instância deve ter aberta somente às portas **80** e **443** para todos os endereços
- A porta SSH (**22**) deve estar acessível somente para um _range_ IP definido.
- **Inputs:** A execução do projeto deve aceitar dois parâmetros:
  - O IP ou _range_ necessário para a liberação da porta SSH
  - A região da _cloud_ em que será provisionada a instância
- **Outputs:** A execução deve imprimir o IP público da instância


## Extras

- Pré-instalar o docker na instância que suba automáticamente a imagem do [Apache](https://hub.docker.com/_/httpd/), tornando a página padrão da ferramenta visualizável ao acessar o IP público da instância
- Utilização de módulos do Terraform

## Notas
- Pode se utilizar tanto AWS quanto GCP (Google Cloud), não é preciso executar o teste em ambas, somente uma.
- Todos os recursos devem ser criados utilizando os créditos gratuitos da AWS/GCP.
- Não esquecer de destruir os recursos após criação e testes do desafio para não haver cobranças ou esgotamento dos créditos.

## Possível solução.

- Para executar esse teste altere as variáveis abaixo no arquivo variables.tf, nesse teste não realizei a parte do Docker

>variable "acces_key" {
>  default = "INFERMAR CHAVE DE ACESSO"
>}
>
>variable "secret_key" {
>    default = "INFORMAR CHAVE DE SEGURANÇA"

Execute os comandos:

>$ terraform plan
>
>var.region
>  Informe a regiao: 
>
>  Enter a value: us-east-1
>
>var.ssh
>  Informe o range ou o IP com /32: 
>
>  Enter a value: 192.168.2.3/32


Depois pode aplicar as alterações

>$ terraform apply

Conferir no console da aws se está tudo ok e depois

>$ terraform destroy

Para destruir o que foi contruido