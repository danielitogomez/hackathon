variable "aws_region" {
  description = "The AWS region to create things in."
  default     = "us-east-1"
}

variable "ami_id" {
  description = "The AMI id to be used for the instance."
  type        = string
  default     = "ami-123456"  # Replace this with the actual AMI ID for your region
}

variable "instance_type" {
  description = "The type of instance to start."
  default     = "t2.micro"
}

variable "public_key_path" {
  description = "The path to the public key to be used for SSH access to the instance."
  default     = "~/.ssh/id_rsa.pub"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "The CIDR block for the subnet."
  default     = "10.0.1.0/24"
}

variable "availability_zone" {
  description = "The availability zone to launch the server in."
  default     = "us-east-1a"
}

variable "my_ip" {
  description = "Your public IP address for SSH access."
  default     = "<Your-IP-Address>"  # Replace with your actual IP address
}

# Update this variable with the AMI ID for Ubuntu
variable "ami_id" {
  description = "The AMI id to be used for the instance."
  type        = string
  # Example: Ubuntu Server 20.04 LTS (HVM), SSD Volume Type
  default     = "ami-123456"  # Replace this with the actual AMI ID for Ubuntu for your region
}