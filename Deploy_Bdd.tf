terraform {
  backend "s3" {}
}

locals {
  timestamp = "${timestamp()}"
}

provider "aws" {
  region = "eu-west-1"
}

# Base RDS

resource "aws_db_instance" "default" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "mydb"
  username             = "admin"
  password             = "azerty1234"
  parameter_group_name = "default.mysql5.7"
  publicly_accessible = "true"
  final_snapshot_identifier = "Ticketing-DB-${local.timestamp}"
  
}
