# Terraform AWS Infrastructure
This Terraform code is designed to set up AWS resources, including an EC2 instance with a specific IAM role and policy for S3 access, an S3 bucket, and security group settings for the EC2 instance.

## Resources Created:
AWS S3 Bucket: An S3 bucket for storing objects.
AWS EC2 Instance: A virtual server in the AWS cloud.
AWS IAM Role and Policy: An IAM role that the EC2 instance assumes, along with an associated policy that allows it to perform specific actions on the S3 bucket.
AWS Security Group: A security group to define which incoming and outgoing network traffic is allowed to the EC2 instance.
Setting Variables:
Variables in this Terraform code can be set in a few ways:

## Default Values in variables.tf: 
Some variables have default values set in the variables.tf file. These values will be used unless overridden.
Using terraform.tfvars or *.auto.tfvars files: You can create a terraform.tfvars file to set values for your variables.
Environment Variables with TF_VAR_ Prefix: As an alternative to using *.tfvars files, you can set Terraform variables via environment variables by prefixing the variable name with TF_VAR_.

## Setting Variables:
Variables in this Terraform code can be set in a few ways:

### Default Values in variables.tf: 
- Some variables have default values set in the variables.tf file. These values will be used unless overridden.

### Using terraform.tfvars or *.auto.tfvars files:
- You can create a terraform.tfvars file to set values for your variables.

### Environment Variables with TF_VAR_ Prefix:
- As an alternative to using *.tfvars files, you can set Terraform variables via environment variables by prefixing the variable name with TF_VAR_.

### List of Available Variables:
**aws_region**: The AWS region where resources will be created.
  - Example: export TF_VAR_aws_region="us-west-1"
    
**s3_bucket_name**: Name of the S3 bucket.
  - Example: export TF_VAR_s3_bucket_name="my-unique-bucket"
    
**aws_profile**: Name of the AWS CLI profile to use.
  - Example: export TF_VAR_aws_profile="myprofile"
    
**ami_id**: AMI ID for the EC2 instance.
  - Example: export TF_VAR_ami_id="ami-0123456789abcdef0"
    
**instance_type**: EC2 instance type.
  - Example: export TF_VAR_instance_type="t2.large"
    
**key_name**: SSH key pair name to associate with the EC2 instance.
  - Example: export TF_VAR_key_name="mykeypair"
    
**security_group_id**: ID of an external security group for the EC2 instance. If empty, the predefined "allow_ssh" group will be used.
  - Example: export TF_VAR_security_group_id="sg-0123456789abcdef0"

## Important Notes:
Ensure you have AWS credentials set up, either via environment variables, AWS CLI configurations, or other AWS SDK configuration methods.
The security group in this code allows all inbound SSH traffic. 

This is not recommended for production deployments. Make sure to restrict the IP addresses that can access your instance.
