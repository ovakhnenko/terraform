/*
Dynamic
*/
provider "aws" {
  default_tags {
    tags = {
      CreatedBy = "Terraform"
    }
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
