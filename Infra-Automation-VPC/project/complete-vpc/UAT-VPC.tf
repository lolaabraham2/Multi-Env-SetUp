module "UAT-VPC" {
  source = "../../"
  name = "uat-vpc"
  cidr = "10.12.0.0/16"

  azs                 = ["us-east-2a", "us-east-2b", "us-east-2c"]
  private_subnets     = ["10.12.1.0/24", "10.12.2.0/24", "10.12.3.0/24"]
  public_subnets      = ["10.12.11.0/24", "10.12.12.0/24", "10.12.13.0/24"]
  database_subnets    = ["10.12.21.0/24", "10.12.22.0/24", "10.12.23.0/24"]
  #elasticache_subnets = ["10.12.31.0/24", "10.12.32.0/24", "10.12.33.0/24"]
  #redshift_subnets    = ["10.12.41.0/24", "10.12.42.0/24", "10.12.43.0/24"]

  #private_subnet_1 = "${module.UAT-VPC.aws_subnet.private[0].id,0}"
  AMIS = "ami-02bcbb802e03574ba"
  webserver_AMIS = "ami-02bcbb802e03574ba"
  appserver_AMIS = "ami-02bcbb802e03574ba"
  dbserver_AMIS = "ami-02bcbb802e03574ba"
  bastionserver_AMIS = "ami-02bcbb802e03574ba"
  create_database_subnet_group = false

  enable_nat_gateway = false
  enable_vpn_gateway = false

  enable_s3_endpoint       = true
  #enable_dynamodb_endpoint = true

  enable_dhcp_options              = true
  dhcp_options_domain_name         = "service.consul"
  dhcp_options_domain_name_servers = ["127.0.0.1", "10.12.0.2"]

  tags = {
    Owner       = "user"
    Environment = "UAT"
    Name        = "UAT-VPC"
  }
}
