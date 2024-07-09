/*
Terraform
Data Source AMI
*/

provider "aws" {}

data "aws_ami" "latest_ubuntu" {
  owners      = ["099720109477"] # AWS -> AMIs
  most_recent = true
  filter {
    name   = "name"
    values = ["*ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"] # AWS -> AMIs
  }
}

data "aws_ami" "latest_amazon_linux" {
  owners      = ["137112412989"] # AWS -> AMIs
  most_recent = true
  filter {
    name   = "name"
    values = ["al202?-ami-*-kernel-6.1-x86_64"] # AWS -> AMIs
  }
}

output "latest_ubuntu_id" {
  value = data.aws_ami.latest_ubuntu.id
}

output "latest_ubuntu_name" {
  value = data.aws_ami.latest_ubuntu.name
}

output "latest_amazon_linux_id" {
  value = data.aws_ami.latest_amazon_linux.id
}

output "latest_amazon_linux_name" {
  value = data.aws_ami.latest_amazon_linux.name
}
