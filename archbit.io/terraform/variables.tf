variable "aws_region" {
  description = "AWS region for the EC2 instance"
  type        = string
  default     = "sa-east-1"
}

variable "s3_bucket_name" {
  description = "S3 bucket name"
  type        = string
  default     = "bucket-s3-shrtkv"
}

variable "aws_profile" {
  description = "Name of the AWS CLI profile to use"
  type        = string
  default     = "default" 
} 

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-0b6c2d49148000cd5"
}

variable "instance_type" {
  description = "Type of the EC2 instance"
  type        = string
  default     = "t2.micro"
}
variable "key_name" {
  description = "The name of the SSH key pair to associate with the EC2 instance."
  type        = string
  default     = "devopsjrchallenge_rsa"
}

variable "security_group_id" {
  description = "ID of an external security group to use for the EC2 instance. If empty, the allow_ssh group is used."
  type        = string
  default     = ""  # Default to no external security group
}


