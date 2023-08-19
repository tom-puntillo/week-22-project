#---vpc-variables.tf

# Define variables for public subnets
variable "pub_sub_1" {
  type    = string
  default = "10.0.1.0/24"  # Default IP range for public subnet 1
}

variable "pub_sub_2" {
  type    = string
  default = "10.0.2.0/24"  # Default IP range for public subnet 2
}

# Define variables for private subnets
variable "private_sub_1" {
  type    = string
  default = "10.0.101.0/24"  # Default IP range for private subnet 1
}

variable "private_sub_2" {
  type    = string
  default = "10.0.102.0/24"  # Default IP range for private subnet 2
}
