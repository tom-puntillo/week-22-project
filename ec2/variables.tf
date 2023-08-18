#---ec2-variables.tf

variable "user_data" {
    type = string
    default = "IyEvYmluL2Jhc2gKCmFwdCB1cGRhdGUgLXkKYXB0IHVwZ3JhZGUgLXkKYXB0IGluc3RhbGwgbmdpbnggLXkKc3lzdGVtY3RsIGVuYWJsZSBuZ2lueApzeXN0ZW1jdGwgc3RhcnQgbmdpbngK"
}

variable "instance_type" {
    type = string
    default = "t2.micro"
}

variable "ami" {
    type = string
    default = "ami-053b0d53c279acc90"
}

variable "public_subnet_1" {
    type = string
    description = "Valid subnets in which to deploy a server"
}

variable "public_subnet_2" {
    type = string
    description = "Valid subnets in which to deploy a server"
}

variable "security_groups" {
    type = list(string)
    description = "list of security groups"
}