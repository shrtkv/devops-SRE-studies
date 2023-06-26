terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  # Uncomment the following block when you are ready to use the S3 backend
  # backend "s3" {
  #   bucket         = "var.state_bucket"
  #   key            = "var.terraform_state_key"
  #   region         = "sa-east-1"
  #   dynamodb_table = "var.dynamodb_lock_table"
  #   encrypt        = true
  # }
}

# Variables
variable "aws_region" {
  description = "AWS region for the EC2 instance"
  type        = string
  default     = ""
}

variable "aws_access_key" {
  description = "AWS access key"
  type        = string
  default     = ""
}

variable "aws_secret_key" {
  description = "AWS secret key"
  type        = string
  default     = ""
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = ""
}

#variable "key_pair" {
#  description = "Key pair for the EC2 instance"
#  type        = string
#  default     = ""
#}

# Configure the AWS Provider
provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

# EC2 Instance
resource "aws_instance" "first-terraform-server" {
  ami           = var.ami_id
  instance_type = "t2.micro"
#  key_name      = var.key_pair

# ... (security groups, user data, etc.)
}
