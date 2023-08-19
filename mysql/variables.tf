# ---mysql variable.tf

# Define a variable for private subnet 1 used by the MySQL instance
variable "private_db_subnet_1" {
    type = string
    description = "private subnet 1 for the mysql instance"
}

# Define a variable for private subnet 2 used by the MySQL instance
variable "private_db_subnet_2" {
    type = string
    description = "private subnet 2 for the mysql instance"
}

# Define a variable for the security group of the MySQL instance
variable "sg" {
    type = string
    description = "security group for mysql instance"
}

# Define a variable for the instance class (size) of the MySQL instance
variable "db_instance_class" {
    type = string
    description = "size of the db instamce"
    default = "db.t2.micro" # Default to a small instance type
}

# Define a variable for the storage size in GiB of the MySQL instance
variable "allocation_size" {
    type = number
    description = "storage size in GiB of db instance"
    default = 20 # Default to 20 GiB
}

# Define a variable for the database engine (default to MySQL)
variable "engine" {
    type = string
    default = "mysql"
}

# Define a variable for the version of the database engine (default to MySQL 8.0.33)
variable "engine_version" {
    type = string
    default = "8.0.33"
}

# Define a variable for the default username of the database instance
variable "username" {
    type = string
    default = "admin"
}

# Define a variable for the default password of the database instance
variable "password" {
    type = string
    default = "password"
}
