#---vpc-main.tf

# Create an AWS VPC with the given CIDR block and a Name tag.
resource "aws_vpc" "week_22_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "week_22_vpc"
  }
}

# Create an AWS Internet Gateway and associate it with the previously created VPC.
resource "aws_internet_gateway" "week_22_igw" {
  vpc_id = aws_vpc.week_22_vpc.id

  tags = {
    Name = "week_22_igw"
  }
}

# Create a public subnet in the specified availability zone, associated with the VPC.
resource "aws_subnet" "public_subnet_1" {
  vpc_id            = aws_vpc.week_22_vpc.id
  cidr_block        = var.pub_sub_1
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "public_subnet_1"
  }
}

# Create another public subnet in a different availability zone, also associated with the VPC.
resource "aws_subnet" "public_subnet_2" {
  vpc_id            = aws_vpc.week_22_vpc.id
  cidr_block        = var.pub_sub_2
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "public_subnet_2"
  }
}

# Create a private subnet in a different availability zone, associated with the VPC.
resource "aws_subnet" "private_subnet_1" {
  vpc_id            = aws_vpc.week_22_vpc.id
  cidr_block        = var.private_sub_1
  availability_zone = "us-east-1c"

  tags = {
    Name = "private_subnet_1"
  }
}

# Create another private subnet in a different availability zone, also associated with the VPC.
resource "aws_subnet" "private_subnet_2" {
  vpc_id            = aws_vpc.week_22_vpc.id
  cidr_block        = var.private_sub_2
  availability_zone = "us-east-1d"

  tags = {
    Name = "private_subnet_2"
  }
}

# Create an Elastic IP (EIP) for NAT Gateway.
resource "aws_eip" "week_22_eip" {
  domain = "vpc"
}

# Create a NAT Gateway associated with the EIP and one of the public subnets.
resource "aws_nat_gateway" "week_22_nat_gw" {
  allocation_id = aws_eip.week_22_eip.id
  subnet_id     = aws_subnet.public_subnet_1.id

  tags = {
    Name = "week_22_nat_gw"
  }

  # Ensure proper ordering by depending on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.week_22_igw]
}

# Create a public route table associated with the VPC, directing traffic to the Internet Gateway.
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

# Create a private route table associated with the VPC, directing traffic to the NAT Gateway.
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

# Associate the public route table with the public subnets.
resource "aws_route_table_association" "public_rt_association_a" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public_rt_association_b" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_rt.id
}

# Associate the private route table with the private subnets.
resource "aws_route_table_association" "private_rt_association_a" {
  subnet_id      = aws_subnet.private_subnet_1.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "private_rt_association_b" {
  subnet_id      = aws_subnet.private_subnet_2.id
  route_table_id = aws_route_table.private_rt.id
}
