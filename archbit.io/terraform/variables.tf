variable "aws_region" {
  description = "AWS region for the EC2 instance"
  type        = string
  default     = "sa-east-1"
}
variable "aws_profile" {
  description = "Name of the AWS CLI profile to use"
  type        = string
  default     = ""  # Replace with your desired default profile name
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
  default     = "ami-034bb51efe941fa1d"
}


variable "instance_type" {
  description = "Type of the EC2 instance"
  type        = string
  default     = "t2.micro"
}
variable "aws_session_token" {
  description = "AWS session token when assuming a role"
  type        = string
  default     = ""
}

variable "s3_bucket_name" {
  description = "S3 bucket name"
  type        = string
  default     = "bucket-example-tokoshiro5"
}


variable "subnet_id" {
  description = "Subnet ID for the EC2 instance"
  type        = string
  default     = ""
}
variable "vpc_id" {
  description = "The ID of the Default VPC where the security group will be created."
  type        = string
  default     = "vpc-0738c08b606c5d37a"
}

variable "key_name" {
  description = "The name of the SSH key pair to associate with the EC2 instance."
  type        = string
  default     = "devopsjrchallenge_rsa"
}