#---ec2-variables.tf

variable "user_data" {
    type = string
    default = "IyEvYmluL2Jhc2gKCmFwdCB1cGRhdGUgLXkKYXB0IHVwZ3JhZGUgLXkKYXB0IGluc3RhbGwgbmdpbngKc3lzdGVtY3RsIGVuYWJsZSBuZ2lueApzeXN0ZW1jdGwgc3RhcnQgbmdpbngK"
}

variable "instance_type" {
    type = string
    default = "t2.micro"
}

variable "subnet_1" {
    type = string
    default = "10.0.1.0/24"
}

variable "subnet_2" {
    type = string
    default = "10.0.2.0/24"
}

variable "ami" {
    type = string
    default = "ami-053b0d53c279acc90"
}
