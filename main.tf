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