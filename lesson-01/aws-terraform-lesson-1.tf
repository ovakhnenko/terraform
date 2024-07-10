provider "aws" {
  #  access_key = ""
  #  secret_key = ""
  #  region     = ""
}

resource "aws_instance" "my_ubuntu" {
  count         = 1
  ami           = "ami-04a81a99f5ec58529"
  instance_type = "t2.micro"

  tags = {
    Name    = "My Ubuntu"
    Owner   = "Vakhnenzon"
    Project = "Terraform"
  }
}
