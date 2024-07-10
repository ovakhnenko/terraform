# variables.tf
variable "ami" {
  type    = string
  default = "ami-06c68f701d8090592" # Amazon Linux in Virginia
}

variable "sandboxes" {
  type = map(object({
    instance_type = string,
    tags          = map(string)
  }))

  default = {
    sandbox_one = {
      instance_type = "t2.micro"
      tags = {
        Name = "Web"
      }
    },
    sandbox_two = {
      instance_type = "t2.micro"
      tags = {
        Name = "App"
      }
    },
    sandbox_three = {
      instance_type = "t2.micro"
      tags = {
        Name = "DB"
      }
    }
  }
}

# main.tf
resource "aws_instance" "sandbox" {
  ami           = var.ami
  for_each      = var.sandboxes
  instance_type = each.value["instance_type"]
  tags          = each.value["tags"]
}
