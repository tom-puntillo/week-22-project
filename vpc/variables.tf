#---vpc-variables.tf

variable "pub_sub_1" {
  type    = string
  default = "10.0.1.0/24"
}

variable "pub_sub_2" {
  type    = string
  default = "10.0.2.0/24"
}

variable "private_sub_1" {
  type    = string
  default = "10.0.101.0/24"
}

variable "private_sub_2" {
  type    = string
  default = "10.0.102.0/24"
}