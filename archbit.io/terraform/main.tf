terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
  profile   = var.aws_profile
}

resource "aws_s3_bucket" "bucket" {
  bucket = var.s3_bucket_name 
}

resource "aws_iam_role" "ec2_s3_access_role" {
  name = "EC2S3AccessRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Principal = {
          Service = "ec2.amazonaws.com"
        },
        Effect = "Allow",
        Sid    = ""
      }
    ]
  })
}

resource "aws_iam_policy" "s3_list_policy" {
  name        = "S3ListPolicy"
  description = "Allows listing S3 buckets and managing objects"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "s3:ListAllMyBuckets",
          "s3:GetBucketLocation"
        ],
        Resource = "*"
      },
      {
        Effect   = "Allow",
        Action   = [
          "s3:ListBucket",
          "s3:GetObject",
          "s3:PutObject",
          "s3:DeleteObject"
        ],
        Resource = "${aws_s3_bucket.bucket.arn}*"  # Grant permissions to all objects in the bucket
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ec2_s3_access_policy_attachment" {
  policy_arn = aws_iam_policy.s3_list_policy.arn
  role       = aws_iam_role.ec2_s3_access_role.name
}

resource "aws_iam_instance_profile" "ec2_s3_access_profile" {
  name = "EC2S3AccessProfile"
  role = aws_iam_role.ec2_s3_access_role.name
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Not recommended for production, restrict to your IP
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "ec2_instance" {
  ami                    = var.ami_id 
  instance_type          = var.instance_type
  key_name               = var.key_name    
  iam_instance_profile   = aws_iam_instance_profile.ec2_s3_access_profile.name
  security_groups = var.security_group_id != "" ? [var.security_group_id] : [aws_security_group.allow_ssh.name]
  associate_public_ip_address = true
  user_data     = <<-EOF
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install -y awscli 

  EOF
  tags = {
    Name = "MyEC2Instance"
  }
}
