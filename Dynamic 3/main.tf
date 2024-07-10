# main.tf
locals {
  virtuals_mashines = {
    "vm1" = { vm_size = "t2.micro", zone = "us-east-1", ami = "ami-06c68f701d8090592" },
    "vm2" = { vm_size = "t2.micro", zone = "us-east-1", ami = "ami-06c68f701d8090592" },
    "vm3" = { vm_size = "t2.micro", zone = "us-east-1", ami = "ami-06c68f701d8090592" }
  }
}

resource "aws_instance" "vm" {
  for_each      = local.virtuals_mashines
  ami           = each.value.ami
  instance_type = each.value.vm_size
  tags = {
    Name = each.key
  }

}
