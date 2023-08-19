# ---mysql main.tf

# Define an AWS DB subnet group resource for MySQL.
resource "aws_db_subnet_group" "mysql_subnet_group" {
    name       = "mysql_subnet_group"               # Name for the subnet group
    subnet_ids = [var.private_db_subnet_1, var.private_db_subnet_2]  # Subnet IDs where the DB instances will be placed
}

# Define an AWS DB instance resource for MySQL.
resource "aws_db_instance" "mysql_db" {
    allocated_storage    = var.allocation_size         # Allocated storage for the DB instance
    apply_immediately    = true                        # Apply changes immediately
    db_subnet_group_name = aws_db_subnet_group.mysql_subnet_group.name  # Use the name of the created subnet group
    engine               = var.engine                  # Database engine (e.g., MySQL)
    engine_version       = var.engine_version          # Engine version
    instance_class       = var.db_instance_class       # Instance type for the DB instance
    skip_final_snapshot  = true                        # Skip creating a final DB snapshot during termination
    username             = var.username                # Username for the DB instance
    password             = var.password                # Password for the DB instance
    vpc_security_group_ids = [var.sg]                  # Security group(s) associated with the DB instance
}