# main.tf
variable "ami" {
  type    = string
  default = "ami-06c68f701d8090592" # Amazon Linux in Virginia
}

resource "aws_instance" "sandbox" {
  for_each = {

    "vm1" = { vm_size = "t2.micro", zone = "us-east-1" }

    "vm2" = { vm_size = "t2.micro", zone = "us-east-1" }

    "vm3" = { vm_size = "t2.micro", zone = "us-east-1" }

  }

  ami           = var.ami
  instance_type = each.value.vm_size
  tags = {
    Name = each.key
  }

}
