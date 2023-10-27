terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = var.s3_bucket_name
}

resource "aws_instance" "my_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  availability_zone = var.availability_zone
  security_groups = [var.security_group_id != "" ? var.security_group_id : var.default_security_group_id]
}

resource "aws_subnet" "my_subnet" {
  count             = var.subnet_id != "" ? 1 : 0
  cidr_block        = var.subnet_cidr_block
  vpc_id            = var.vpc_id
  availability_zone = var.availability_zone
}
