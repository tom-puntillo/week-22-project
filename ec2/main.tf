#---ec2-main.tf---
resource "aws_instance" "web_server_1" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id = var.public_subnet_1
  user_data = var.user_data
  vpc_security_group_ids = var.security_groups
}

resource "aws_instance" "web_server_2" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id = var.public_subnet_2
  user_data = var.user_data
  vpc_security_group_ids = var.security_groups
}

