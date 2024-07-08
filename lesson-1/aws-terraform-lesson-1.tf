provider "aws" {
  access_key = ""
  secret_key = ""
  region     = "us-east-1"
}

resource "aws_instance" "my_ubuntu" {
  ami           = "ami-04a81a99f5ec58529"
  instance_type = "t2.micro"
}
