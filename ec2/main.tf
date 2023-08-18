#---ec2-main.tf---
resource "aws_instance" "web_server" {
  ami           = var.ami
  instance_type = var.instance_type
  user_data = var.user_data
  vpc_security_group_ids = var.security_groups
}

