terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}
provider "aws" {
  region    = var.aws_region
  profile   = var.aws_profile
}
resource "aws_instance" "my_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  key_name      = var.key_name
  user_data     = <<-EOF
    #!/bin/bash
    apt-get update && apt-get install -y awscli
    
  EOF

  vpc_security_group_ids = [aws_security_group.ssh_security_group.id]
  iam_instance_profile = aws_iam_instance_profile.ec2_s3_instance_profile.name
  
}
resource "aws_s3_bucket" "devopsjrchallenge_bucket" {
  bucket = var.s3_bucket_name
}
resource "aws_iam_role" "ec2_s3_role" {
  name = "ec2_s3_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}
resource "aws_iam_instance_profile" "ec2_s3_instance_profile" {
  name = "ec2_s3_instance_profile" 
  role = aws_iam_role.ec2_s3_role.name
}
resource "aws_iam_policy" "s3_policy" {
  name        = "s3_access_policy"
  description = "Allow EC2 to access S3 bucket"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "s3:ListBucket",
          "s3:GetObject",
          "s3:PutObject",
          "s3:DeleteObject"
        ],
        Effect   = "Allow",
        Resource = "arn:aws:s3:::${var.s3_bucket_name}/*" 
      }
    ]
  })
}
resource "aws_iam_role_policy_attachment" "s3_policy_attachment" {
  policy_arn = aws_iam_policy.s3_policy.arn
  role       = aws_iam_role.ec2_s3_role.name
}


resource "aws_security_group" "ssh_security_group" {
name        = "ssh_security_group"
description = "SSH inbound / All outbound"
vpc_id      = var.vpc_id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"           
    cidr_blocks = ["0.0.0.0/0"] 
  }

  tags = {
    Name = "devops-jr-challenge"
  }
}

