module "vpc" {
  source        = "./modules/vpc"
  AWS_REGION    = var.AWS_REGION
  VPC_CIDR      = var.VPC_CIDR
  PUBLIC_SUBNET = var.PUBLIC_SUBNET
}
module "alb" {
  source                = "./modules/alb"
  vpc-id                = module.vpc.vpc-id
  alb-security-group-id = module.vpc.alb-security-group-id
  public-subnets        = module.vpc.public-subnets
  ec2-instance-id_1     = module.ec2-1.ec2-instance-id
  ec2-instance-id_2     = module.ec2-2.ec2-instance-id
}

module "ec2-1" {
  source                     = "./modules/ec2"
  SUBNET_ID                  = module.vpc.public_subnet_1
  EC2                        = var.EC2.ec2-1
  instance-security-group-id = [module.vpc.instance-security-group-id]
}

module "ec2-2" {
  source                     = "./modules/ec2"
  SUBNET_ID                  = module.vpc.public_subnet_2
  EC2                        = var.EC2.ec2-2
  instance-security-group-id = [module.vpc.instance-security-group-id]
}

module "dns_zone" {
  source            = "./modules/dns_zone"
  vpc_id            = module.vpc.vpc-id
  ec2_instance_1_ip = module.ec2-1.public_ip
  ec2_instance_2_ip = module.ec2-2.public_ip
  dns_name          = module.alb.alb-dns
  alb_zone_id       = module.alb.alb-zone-id

}
