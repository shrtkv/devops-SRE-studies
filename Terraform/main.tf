terraform {
  required_providers {
    aws = {
        source  = "hashicorp/aws"
        version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
    region = "sa-east-1"
    access_key = $AWS_ACCESS_KEY
    secret_key = $AWS_SECRET_KEY
}

# Create a VPC
#resource "aws_vpc" "example" {
#    cidr_block = "10.0.0.0/16"
#}