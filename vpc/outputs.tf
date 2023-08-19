#---vpc-outputs.tf

# Output for the ID of Public Subnet 1
output "public_subnet_1_id" {
    description = "Public Subnet 1 ID"
    value = aws_subnet.public_subnet_1.id
}

# Output for the ID of Public Subnet 2
output "public_subnet_2_id" {
    description = "Public Subnet 2 ID"
    value = aws_subnet.public_subnet_2.id
}

# Output for the ID of Private Subnet 1 for MySQL db
output "private_db_subnet_1" {
    description ="Private subnet for MySQL db"
    value = aws_subnet.private_subnet_1.id
}

# Output for the ID of Private Subnet 2 for MySQL db
output "private_db_subnet_2" {
    description ="Private subnet for MySQL db"
    value = aws_subnet.private_subnet_2.id
}

# Output for the ID of the custom VPC
output "vpc_id" {
    description = "ID of custom VPC"
    value = aws_vpc.week_22_vpc.id
}
