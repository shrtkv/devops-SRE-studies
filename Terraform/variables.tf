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
###
variable "instance_type" {
  description = "Type of the EC2 instance"
  type        = string
  default     = "t2.micro"
}
variable "AZ" {
  description = "Availability Zone for the EC2 instance"
  type        = string
  default     = "sa-east-1a"
}
