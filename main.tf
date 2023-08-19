#---root-main.tf

# Declare a module named "vpc" sourced from the "./vpc" directory
module "vpc" {
  source = "./vpc"
}

# Declare a module named "ec2_web_servers" sourced from the "./ec2" directory
module "ec2_web_servers" {
  source = "./ec2"

  # Pass the IDs of public subnets from the "vpc" module as inputs
  public_subnet_1 = module.vpc.public_subnet_1_id
  public_subnet_2 = module.vpc.public_subnet_2_id

  # Pass security groups for HTTP and TLS from the "security_groups" module
  security_groups = [module.security_groups.security_group_http, module.security_groups.security_group_tls]
}

# Declare a module named "security_groups" sourced from the "./security_groups" directory
module "security_groups" {
  source = "./security_groups"

  # Pass the VPC ID from the "vpc" module as an input
  vpc_id = module.vpc.vpc_id
}

# Declare a module named "mysql" sourced from the "./mysql" directory
module "mysql" {
  source = "./mysql"

  # Pass the MySQL security group from the "security_groups" module
  sg = module.security_groups.security_group_mysql

  # Pass private DB subnets from the "vpc" module as inputs
  private_db_subnet_1 = module.vpc.private_db_subnet_1
  private_db_subnet_2 = module.vpc.private_db_subnet_2
}
