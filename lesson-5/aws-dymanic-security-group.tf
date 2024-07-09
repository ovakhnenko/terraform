/*
Terraform
External Script
*/

provider "aws" {}

resource "aws_instance" "my_websever" {
  count                  = 1
  ami                    = "ami-06c68f701d8090592" # Amazon Linux
  instance_type          = "t2.micro"
  key_name               = "rsa-virginia"
  vpc_security_group_ids = [aws_security_group.my_websever.id]
  user_data = templatefile("user_data.sh.tpl", {
    f_name = "lex",
    l_name = "vakhnenzon",
    list   = ["111", "222", "333"]
  })

  tags = {
    Name  = "My Webserver"
    Owner = "Vakhnenzon"
  }
}

resource "aws_security_group" "my_websever" {
  name        = "sg_ssh_http_my_webserver"
  description = "sg_ssh_http_my_webserver"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # any protocols
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = "My Security Group"
    Owner = "Vakhnenzon"
  }

}
