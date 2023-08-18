#---root-main.tf

module "vpc" {
  source = "./vpc"
}

module "ec2_web_server_1" {
  source = "./ec2"

  subnets = module.vpc.public_subnet_1_id

  security_groups = [module.security_groups.security_group_http, module.security_groups.security_group_tls]
}

module "ec2_web_server_2" {
  source = "./ec2"

  subnets = module.vpc.public_subnet_2_id

  security_groups = [module.security_groups.security_group_http, module.security_groups.security_group_tls]
}

module "security_groups" {
  source = "./security_groups"

  vpc_id = module.vpc.vpc_id
}