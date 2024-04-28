resource "aws_key_pair" "aws_key" {
  key_name   = "aws-key"
  public_key = var.aws_key_pub
}

resource "aws_instance" "vm" {
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.aws_key.key_name
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.subnet.id
  vpc_security_group_ids      = [aws_security_group.security_group.id]

  tags = local.common_tags

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("./aws-key")
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    script = "install-docker.sh"
  }

  provisioner "file" {
    source      = "./experience.zip"
    destination = "/tmp/experience.zip"

  }

  provisioner "file" {
    source      = "./dockerfile"
    destination = "/tmp/dockerfile"
  }

  provisioner "remote-exec" {
    script = "create-container.sh"
  }

}