variable "aws_region" {
  description = "The AWS region to create things in."
  default     = "us-east-1"
}

variable "availability_zone" {
  description = "The availability zone to launch the server in."
  default     = "us-east-1a"
}

variable "instance_type" {
  description = "The type of instance to start."
  default     = "t2.micro"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "The CIDR block for the subnet."
  default     = "10.0.1.0/24"
}

variable "public_key_path" {
  description = "The path to the public key to be used for SSH access to the instance."
  default     = "/home/danijarvis/.ssh/hackathon_poc.pub"
}

# Update this variable with the AMI ID for Ubuntu
variable "ami_id" {
  description = "The AMI id to be used for the instance."
  type        = string
  # Example: Ubuntu Server 20.04 LTS (HVM), SSD Volume Type
  default     = "ami-051f8a213df8bc089"  # Replace this with the actual AMI ID for Ubuntu for your region
}