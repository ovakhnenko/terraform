/*
Terraform
Dynamic Security Group
*/

provider "aws" {}

resource "aws_security_group" "my_websever" {
  name        = "sg_ssh_http_dynamic"
  description = "sg_ssh_http_dynamic"

  /*
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
*/

  dynamic "ingress" {
    for_each = ["22", "80", "443", "8000", "8080", "8888", "9999"]
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # any protocols
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = "My Dynamic Security Group"
    Owner = "Vakhnenzon"
  }

}
