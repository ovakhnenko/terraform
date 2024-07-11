provider "aws" {}

variable "password_rds_version" {
  default = "v.1.001"
}
resource "random_string" "rds_password" {
  length = 16
  special = true
  #override_special = "!@#$%^"
  keepers = {
    keeper1 = var.password_rds_version # если изменить password_rds_version - сгенерируется новый пароль -> в базу
  }
}

resource "aws_ssm_parameter" "rds_password" {
  name = "/prod/mysql"
  description = "Master password for RDS MySQL"
  type = "SecureString"
  value = random_string.rds_password.result
}

data "aws_ssm_parameter" "rds_password" {
  name = "/prod/mysql"
  depends_on = [ aws_ssm_parameter.rds_password ]
}

output "rds_password" {
  sensitive = true
  value = data.aws_ssm_parameter.rds_password.value
}

resource "aws_db_instance" "default" {
  allocated_storage    = 10
  db_name              = "my_mysql"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = "administrator"
  password             = data.aws_ssm_parameter.rds_password.value
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
  apply_immediately    = true
}
