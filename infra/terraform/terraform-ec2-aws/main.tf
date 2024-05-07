terraform {
  backend "s3" {
    bucket         = "terraform-s3-state-hackathon"
    key            = "my-terraform-project/terraform.tfstate"
    region         = "us-east-1"
    shared_credentials_file = "/home/danijarvis/.aws/credentials"
  }
}


resource "aws_vpc" "hackathon" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "hackathon-vpc"
  }
}

resource "aws_subnet" "hackathon" {
  vpc_id                  = aws_vpc.hackathon.id
  cidr_block              = var.subnet_cidr
  map_public_ip_on_launch = true
  availability_zone       = var.availability_zone

  tags = {
    Name = "hackathon-subnet"
  }
}

resource "aws_internet_gateway" "hackathon" {
  vpc_id = aws_vpc.hackathon.id

  tags = {
    Name = "hackathon-igw"
  }
}

resource "aws_route_table" "hackathon" {
  vpc_id = aws_vpc.hackathon.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.hackathon.id
  }

  tags = {
    Name = "hackathon-route-table"
  }
}

resource "aws_route_table_association" "hackathon" {
  subnet_id      = aws_subnet.hackathon.id
  route_table_id = aws_route_table.hackathon.id
}

resource "aws_security_group" "hackathon" {
  name        = "hackathon-allow-ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = aws_vpc.hackathon.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 2222
    to_port     = 2222
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 4000
    to_port     = 4000
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
    Name = "hackathon-allow-ssh"
  }
}

resource "aws_instance" "hackathon" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.hackathon.id
  vpc_security_group_ids = [aws_security_group.hackathon.id]
  key_name               = aws_key_pair.deployer.key_name

  tags = {
    Name = "hackathonInstance"
  }
}

resource "aws_key_pair" "deployer" {
  key_name = "deployer-key"
  #public_key = file(var.public_key)
  public_key = var.public_key
}
