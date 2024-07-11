provider "aws" {}

resource "null_resource" "command1" {
    provisioner "local-exec" {
      command = "echo Hallo Terraform! > terraform.log"
    }
}

resource "null_resource" "command2" {
    provisioner "local-exec" {
      command = "print('Hello Python!')"
      interpreter = [ "python", "-c" ]
    }  
}

resource "null_resource" "command3" {
  provisioner "local-exec" {
    command = "echo $MY_MESSAGE1 $MY_MESSAGE2 > names.log"
    environment = {
      MY_MESSAGE1 = "Hello"
      MY_MESSAGE2 = "Echo!"
    }
  }
}

