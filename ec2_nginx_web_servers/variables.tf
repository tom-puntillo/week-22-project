variable "ami" {
    type = string
    default = "ami-053b0d53c279acc90"
}

variable "instance_type" {
    type = string
    default = "t2.micro"
}

variable "user_data" {
    type = string
    default = "IyEvYmluL2Jhc2gKCmFwdCB1cGRhdGUgLXkKYXB0IHVwZ3JhZGUgLXkKYXB0IGluc3RhbGwgbmdpbnggLXkKc3lzdGVtY3RsIGVuYWJsZSBuZ2lueApzeXN0ZW1jdGwgc3RhcnQgbmdpbngK"
}