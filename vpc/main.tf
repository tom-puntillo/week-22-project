#---vpc-main.tf

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
  vpc_id            = aws_vpc.week_22_vpc.id
  cidr_block        = var.pub_sub_1
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "public_subnet_1"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id            = aws_vpc.week_22_vpc.id
  cidr_block        = var.pub_sub_2
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "public_subnet_2"
  }
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id            = aws_vpc.week_22_vpc.id
  cidr_block        = var.private_sub_1
  availability_zone = "us-east-1c"

  tags = {
    Name = "private_subnet_1"
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id            = aws_vpc.week_22_vpc.id
  cidr_block        = var.private_sub_2
  availability_zone = "us-east-1d"

  tags = {
    Name = "private_subnet_2"
  }
}

resource "aws_eip" "week_22_eip" {
  domain = "vpc"
}

resource "aws_nat_gateway" "week_22_nat_gw" {
  allocation_id = aws_eip.week_22_eip.id
  subnet_id     = aws_subnet.public_subnet_1.id

  tags = {
    Name = "week_22_nat_gw"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.week_22_igw]
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.week_22_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.week_22_igw.id
  }

  tags = {
    Name = "public_rt"
  }
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.week_22_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.week_22_nat_gw.id
  }

  tags = {
    Name = "private_rt"
  }
}

resource "aws_route_table_association" "public_rt_association_a" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public_rt_association_b" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "private_rt_association_a" {
  subnet_id      = aws_subnet.private_subnet_1.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "private_rt_association_b" {
  subnet_id      = aws_subnet.private_subnet_2.id
  route_table_id = aws_route_table.private_rt.id
}