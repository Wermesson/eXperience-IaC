variable "ami" {
  default = "ami-080e1f13689e07408"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "s3_bucket" {
  type    = string
  default = "experience-ec2"
}

variable "aws_key_pub" {
  type = string
}