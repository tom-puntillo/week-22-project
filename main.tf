#---root-main.tf

module "vpc" {
  source = "./vpc"
}

module "ec2_web_servers" {
  source = "./ec2"
}

