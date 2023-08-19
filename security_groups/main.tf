# ---security_groups main.tf

# Create a security group named "allow_http" to allow HTTP inbound traffic
resource "aws_security_group" "allow_http" {
  name        = "allow_http"
  description = "Allow HTTP inbound traffic"
  vpc_id      = var.vpc_id  # Use the VPC ID specified in the variable

  ingress {
    description = "HTTP from Anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow traffic from any IP address
  }

  ingress {
    description = "SSH from Anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow SSH traffic from any IP address
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"        # Allow all outbound traffic
    cidr_blocks      = ["0.0.0.0/0"]  # Allow traffic to any IP address
    ipv6_cidr_blocks = ["::/0"]      # Allow IPv6 traffic to any IP address
  }

  tags = {
    Name = "allow_http"
  }
}

# Create a security group named "allow_tls" to allow TLS inbound traffic
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = var.vpc_id  # Use the VPC ID specified in the variable

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow TLS traffic from any IP address
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"        # Allow all outbound traffic
    cidr_blocks      = ["0.0.0.0/0"]  # Allow traffic to any IP address
    ipv6_cidr_blocks = ["::/0"]      # Allow IPv6 traffic to any IP address
  }

  tags = {
    Name = "allow_tls"
  }
}

# Create a security group named "mysql_sg" to allow inbound MySQL traffic
resource "aws_security_group" "mysql_sg" {
  name        = "allow_mysql"
  description = "Allow inbound MySQL traffic"
  vpc_id      = var.vpc_id  # Use the VPC ID specified in the variable

  ingress {
    description      = "Allow MySQL from allow_http"
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    security_groups = [aws_security_group.allow_http.id]  # Allow traffic from the "allow_http" security group
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"        # Allow all outbound traffic
    cidr_blocks      = ["0.0.0.0/0"]  # Allow traffic to any IP address
    ipv6_cidr_blocks = ["::/0"]      # Allow IPv6 traffic to any IP address
  }

  tags = {
    Name = "allow_mysql"
  }
}
