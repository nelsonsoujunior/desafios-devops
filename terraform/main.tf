# Configure the AWS Provider
provider "aws" {
  region     = "${var.region}"
  access_key = "${var.acces_key}"
  secret_key = "${var.secret_key}"
}
resource "aws_instance" "web" {
  ami = "${var.ami}"
  instance_type = "${var.type}"
}

resource "aws_key_pair" "admin_key" {
  key_name   = "admin_key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCTNycIVZZ4qDZbC4cw2GJvyyPRxXmczHOYXFOU7tR40q6h8VEjz9a1R0LcD6vL7DRFZniwPEsEcPZnHapWEhD+CDW1ebh2jJs559CHNl2VMi3rgk4iuNNnYseCbVIYpi3a8jL8bhQZlA62xAOrVsijX1FyBtiaJdrz9B10QWgFFqBdu60rzair2K6uIgV/1cfse+NJ/M8ZSstGu8FXVRX1RyJZ3ZYOvmyTzzTK443RLyi0ix/BlvIu3awzll7xYlDLaH+U52EaWJMeGpTWFrs3+hn+5aYkD/KVv3eHbRpPldhV4+wuk8kg/NvTRaFU7l9gbR8heZRU44lrNi0w8kP5 aws_terraform_ssh_key"
}

resource "aws_vpc" "main" {
  cidr_block       = "192.168.0.0/16"

  tags = {
    Name = "Main"
  }
}

resource "aws_subnet" "publica" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "192.168.1.0/24"

  tags = {
    Name = "Main"
  }
}

resource "aws_subnet" "privada" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "192.168.2.0/24"

  tags = {
    Name = "Main"
  }
}

resource "aws_security_group" "web" {
    name = "web"
    description = "SG web 80 e 443"
    vpc_id = "${aws_vpc.main.id}"

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks     = ["${var.ip}"]
    }

    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks     = ["${var.ip}"]
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks     = ["${var.ssh}"]
    }
}

resource "aws_security_group_rule" "in_ping" {
  type        = "ingress"
  from_port   = -1
  to_port     = -1
  protocol    = "icmp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.web.id}"
}

output "IP" {
  value = "${aws_instance.web.public_ip}"
}
