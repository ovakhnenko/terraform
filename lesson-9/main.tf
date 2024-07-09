/*
Terraform
Data Source
*/

provider "aws" {}

data "aws_availability_zones" "working" {}
data "aws_caller_identity" "current" {}
data "aws_region" "current" {}
data "aws_vpc" "selected" {
  /*  tags = {
    name = "prod" # фильтр
  }*/
}

output "data_aws_availability_zones" {
  value = data.aws_availability_zones.working.names
}

output "data_aws_caller_identity" {
  value = data.aws_caller_identity.current.account_id
}

output "data_aws_region_name" {
  value = data.aws_region.current.name
}

output "data_aws_region_description" {
  value = data.aws_region.current.description
}

output "data_aws_vpc_id" {
  value = data.aws_vpc.selected.id
}

output "data_aws_vpc_cidr" {
  value = data.aws_vpc.selected.cidr_block
}

resource "aws_subnet" "my_subnet_1" {
  vpc_id            = data.aws_vpc.selected.id
  availability_zone = data.aws_availability_zones.working.names[0]
  cidr_block        = "172.31.101.0/24"
  tags = {
    Name   = "My Subnet 1 in ${data.aws_availability_zones.working.names[0]}"
    Region = data.aws_region.current.description
  }
}

resource "aws_subnet" "my_subnet_2" {
  vpc_id            = data.aws_vpc.selected.id
  availability_zone = data.aws_availability_zones.working.names[1]
  cidr_block        = "172.31.102.0/24"
  tags = {
    Name   = "My Subnet 2 in ${data.aws_availability_zones.working.names[1]}"
    Region = data.aws_region.current.description
  }
}
