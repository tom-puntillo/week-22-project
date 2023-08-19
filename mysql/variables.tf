variable "private_db_subnet_1" {
    type = string
    description = "private subnet 1 for the mysql instance"
}

variable "private_db_subnet_2" {
    type = string
    description = "private subnet 2 for the mysql instance"
}

variable "sg" {
    type = string
    description = "security group for mysql instance"
}

variable "db_instance_class" {
    type = string
    description = "size of the db instamce"
    default = "db.t2.micro"
}

variable "allocation_size" {
    type = number
    description = "storage size in GiB of db instance"
    default = 20
}

variable "engine" {
    type = string
    default = "mysql"
}

variable "engine_version" {
    type = string
    default = "8.0.33"
}

variable "username" {
    type = string
    default = "admin"
}

variable "password" {
    type = string
    default = "password"
}