provider "aws" {
  region     = var.aws_region
  access_key = ""
  secret_key = ""
}
terraform {
  required_version = ">= 1.0.0"
}
