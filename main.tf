resource "aws_vpc" "week_22_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "week_22_vpc"
  }
}

resource "aws_internet_gateway" "week_22_igw" {
  vpc_id = aws_vpc.week_22_vpc.id

  tags = {
    Name = "week_22_igw"
  }
}

resource "aws_subnet" "public_subnet_1" {
  vpc_id     = aws_vpc.week_22_vpc.id
  cidr_block = var.pub_sub_1

  tags = {
    Name = "public_subnet_1"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id     = aws_vpc.week_22_vpc.id
  cidr_block = var.pub_sub_2

  tags = {
    Name = "public_subnet_2"
  }
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id     = aws_vpc.week_22_vpc.id
  cidr_block = var.private_sub_1

  tags = {
    Name = "private_subnet_1"
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id     = aws_vpc.week_22_vpc.id
  cidr_block = var.private_sub_2
  tags = {
    Name = "private_subnet_2"
  }
}