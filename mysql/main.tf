resource "aws_db_subnet_group" "mysql_subnet_group"{
    name = "mysql_subnet_group"
    subnet_ids = [var.private_db_subnet_1, var.private_db_subnet_2]
}

resource "aws_db_instance" "mysql_db" {
    allocated_storage = var.allocation_size
    db_subnet_group_name = aws_db_subnet_group.mysql_subnet_group.name
    engine = var.engine
    engine_version = var.engine_version
    instance_class = var.db_instance_class
    username = var.username
    password = var.password
    vpc_security_group_ids = [var.sg]
}