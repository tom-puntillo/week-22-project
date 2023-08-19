#---security_groups outputs.tf

# Define an output named "security_group_http" that will provide the ID of the AWS security group named "allow_http".
output "security_group_http" {
    value = aws_security_group.allow_http.id  # Access the ID of the "allow_http" security group
}

# Define an output named "security_group_tls" that will provide the ID of the AWS security group named "allow_tls".
output "security_group_tls" {
    value = aws_security_group.allow_tls.id  # Access the ID of the "allow_tls" security group
}

# Define an output named "security_group_mysql" that will provide the ID of an AWS security group named "mysql_sg".
output "security_group_mysql" {
    value = aws_security_group.mysql_sg.id  # Access the ID of the "mysql_sg" security group
}
