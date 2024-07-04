terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

module "network" {
  source = "./local_modules/network"
  # vpc_id             = aws_vpc.dy_vpc.id
  vpc_cidr_block       = "192.168.0.0/16"
  public_subnet_cidrs  = ["192.168.1.0/24", "192.168.2.0/24"]
  private_subnet_cidrs = ["192.168.3.0/24", "192.168.4.0/24"]
  availability_zones   = ["us-east-1a", "us-east-1b"]
}

module "ec2-resources" {
  source            = "./local_modules/ec2-resources"
  for_each = var.ec2_resources_configuration

  vpc_id            = module.network.vpc_id
  public_subnet_ids = module.network.public_subnet_ids
  # key_name         = var.key_name
  public_key_path  = each.value.public_key_path
  # ami_id           = var.ami_id
  # instance_type    = var.instance_type
  # security_groups_id = module.network.security_groups_id
  # subnet_id        = module.network.public_subnet_ids[0]
  # vpc_id           = module.network.vpc_id
  # depends_on         = [module.ec2-resources]
}