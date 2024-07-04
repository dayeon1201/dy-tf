resource "aws_vpc" "dy_vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "${local.common_name}-vpc"
  }
}

resource "aws_internet_gateway" "dy_igw" {
  vpc_id = aws_vpc.dy_vpc.id
  tags = {
    Name = "dy-igw"
  }
}

resource "aws_nat_gateway" "dy_nat_gw" {
  count = var.is_nat_enabled ? 1 : 0

  allocation_id = aws_eip.dy_nat_eip.id
  # subnet_id     = module.subnet.public_subnet_ids[0]
  subnet_id = aws_subnet.dy_private_subnet[0].id #public
  tags = {
    Name = "dy-nat-gw"
  }
}

resource "aws_eip" "dy_nat_eip" {
  vpc = true
}
