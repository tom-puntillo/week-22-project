#---vpc-outputs.tf

output "public_subnet_1_id" {
    description = "Public Subnet 1 ID"
    value = aws_subnet.public_subnet_1.cidr_block
}

output "public_subnet_2_id" {
    description = "Public Subnet 2 ID"
    value = aws_subnet.public_subnet_2.cidr_block
}

output "vpc_id" {
    description = "id of custome vpc"
    value = aws_vpc.week_22_vpc.id
}