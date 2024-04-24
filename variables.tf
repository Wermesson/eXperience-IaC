variable "ami" {
  default = "ami-04e5276ebb8451442"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "s3_bucket" {
  type = string
  default = "experience-ec2"
}

variable "aws_key" {
  type = string
}