#---ec2-variables.tf

# Define a variable named "user_data" of type string with a default value.
variable "user_data" {
    type = string
    default = "IyEvYmluL2Jhc2gKCmFwdCB1cGRhdGUgLXkKYXB0IHVwZ3JhZGUgLXkKYXB0IGluc3RhbGwgbmdpbnggLXkKc3lzdGVtY3RsIGVuYWJsZSBuZ2lueApzeXN0ZW1jdGwgc3RhcnQgbmdpbngKYXB0LWdldCBpbnN0YWxsIG1hcmlhZGItY2xpZW50IC15Cg=="
}

# Define a variable named "instance_type" of type string with a default value.
variable "instance_type" {
    type = string
    default = "t2.micro"
}

# Define a variable named "ami" of type string with a default value.
variable "ami" {
    type = string
    default = "ami-053b0d53c279acc90"
}

# Define a variable named "public_subnet_1" of type string with a description.
variable "public_subnet_1" {
    type = string
    description = "Valid subnets in which to deploy a server"
}

# Define a variable named "public_subnet_2" of type string with a description.
variable "public_subnet_2" {
    type = string
    description = "Valid subnets in which to deploy a server"
}

# Define a variable named "security_groups" of type list of strings with a description.
variable "security_groups" {
    type = list(string)
    description = "list of security groups"
}