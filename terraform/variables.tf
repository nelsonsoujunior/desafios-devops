variable "region" {
    #default = "us-east-1"
    description = "Informe a regiao: "
}

variable "acces_key" {
  default = "INFERMAR CHAVE DE ACESSO"
}

variable "secret_key" {
    default = "INFORMAR CHAVE DE SEGURANÇA"
}

variable "ami" {
  default = "ami-0b69ea66ff7391e80"
}

variable "type" {
  default = "t2.micro"
}

variable "ip" {
    default = "0.0.0.0/0"
  
}

variable "vpc" {
  default = "vpc-034529fc41735dcc9"

}

variable "ssh" {
      description = "Informe o range ou o IP com /32: "

}