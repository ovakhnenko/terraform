/*
Terraform
Resources LifeCycle & Zero DownTime
*/

provider "aws" {}

resource "aws_eip" "my_elastic_ip" {
  instance = aws_instance.my_websever.id
}

resource "aws_instance" "my_websever" {
  ami                    = "ami-06c68f701d8090592" # Amazon Linux
  instance_type          = "t2.micro"
  key_name               = "rsa-virginia"
  vpc_security_group_ids = [aws_security_group.my_websever.id]
  user_data = templatefile("user_data.sh.tpl", {
    f_name = "lex",
    l_name = "vakhnenzon",
    list   = ["111", "222", "333", "444", "555"]
  })

  tags = {
    Name  = "My Webserver"
    Owner = "Vakhnenzon"
  }
  /*
  lifecycle {
    prevent_destroy = true
  }
  */

  /*
  lifecycle {
    ignore_changes = ["ami", "user_data"]
  }
  */

  lifecycle {
    create_before_destroy = true
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
