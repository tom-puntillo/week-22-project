resource "aws_instance" "web_server_1" {
  ami           = var.ami
  instance_type = var.instance_type
  user_data = var.user_data
  subnet_id = "_2_tier_vpc.public_subnet_1_id"
}

resource "aws_instance" "web_server_2" {
  ami           = var.ami
  instance_type = var.instance_type
  user_data = var.user_data
  subnet_id = "_2_tier_vpc.public_subnet_2_id"
}