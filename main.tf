module "_2_tier_vpc" {
  source = "./2_tier_vpc"
}

module "_ec2_nginx_web_servers" {
  source = "./ec2_nginx_web_servers"
}