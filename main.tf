#---root-main.tf

module "vpc" {
  source = "./vpc"
}

module "ec2_web_servers" {
  source = "./ec2"

  public_subnet_1 = module.vpc.public_subnet_1_id

  public_subnet_2 = module.vpc.public_subnet_2_id

  security_groups = [module.security_groups.security_group_http, module.security_groups.security_group_tls]
}

module "security_groups" {
  source = "./security_groups"

  vpc_id = module.vpc.vpc_id
}

module "mysql" {
  source = "./mysql"

  sg = module.security_groups.security_group_mysql

  private_db_subnet = module.vpc.private_db_subnet
}