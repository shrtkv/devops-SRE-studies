variable "aws_region" {
  description = "AWS region for the EC2 instance"
  type        = string
  default     = "sa-east-1"
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
  default     = "ami-0af6e9042ea5a4e3e"
}

variable "instance_type" {
  description = "Type of the EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "s3_bucket_name" {
  description = "S3 bucket name"
  type        = string
  default     = "bucket-example-tokoshiro5"
}

variable "vpc_id" {
  description = "VPC ID for the EC2 instance"
  type        = string
  default     = ""
}

variable "subnet_id" {
  description = "Subnet ID for the EC2 instance"
  type        = string
  default     = ""
}

variable "subnet_cidr_block" {
  description = "CIDR block for the subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "availability_zone" {
  description = "Availability Zone for the EC2 instance"
  type        = string
  default     = "sa-east-1a"
}

variable "security_group_id" {
  description = "Security Group ID for the EC2 instance"
  type        = string
  default     = ""
}
variable "default_security_group_id" {
  description = "Default Security Group ID for the EC2 instance"
  type        = string
  default     = ""
}