terraform {

  required_version = ">= 1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.46.0"
    }
  }
  backend "s3" {
    bucket = "experience-ec2"
    key    = "experience-ec2/terraform.tfstate"
    region = "us-east-1"
  }
}