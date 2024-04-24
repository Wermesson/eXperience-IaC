resource "aws_instance" "vm" {
  ami                         = var.ami
  instance_type               = var.instance_type
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.subnet.id
  vpc_security_group_ids      = [aws_security_group.security_group.id]

  tags = local.common_tags

  provisioner "file" {
    source      = "/experience"
    destination = "/tmp/experience"
  }

  provisioner "file" {
    source      = "dockerfile"
    destination = "/tmp/"
  }

}