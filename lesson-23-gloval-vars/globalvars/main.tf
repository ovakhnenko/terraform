/*

My Terraform
Global Variables in Remote State on S3

*/

provider "aws" {}

terraform {
  backend "s3" {
    bucket = "vakhnenzon-project-terraform-state"
    key    = "globalvars/terraform.tfstate"
    region = "us-east-1"
  }
}

output "company_name" {
  value = "Amazon"
}

output "owner" {
  value = "lexx"
}

output "tags" {
  value = {
    Project    = "Terraform"
    CostCenter = "R&D"
    Country    = "USA"
  }
}
