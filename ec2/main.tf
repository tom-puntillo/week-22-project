#---ec2-main.tf---
resource "aws_instance" "web_server_1" {
  ami           = var.ami
  instance_type = var.instance_type
  user_data = var.user_data
  subnet_id = var.subnet_1
}

resource "aws_instance" "web_server_2" {
  ami           = var.ami
  instance_type = var.instance_type
  user_data = var.user_data
  subnet_id = var.subnet_2
}

