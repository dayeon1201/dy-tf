resource "aws_subnet" "dy_public_subnet" {
  count                   = length(var.public_subnet_cidrs)
  vpc_id                  = aws_vpc.dy_vpc.id
  cidr_block              = var.public_subnet_cidrs[count.index]
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = true
  tags = {
    Name = format("dy-public-subnet-%d", count.index + 1)
  }
}

resource "aws_subnet" "dy_private_subnet" {
  count             = length(var.private_subnet_cidrs)
  vpc_id            = aws_vpc.dy_vpc.id
  cidr_block        = var.private_subnet_cidrs[count.index]
  availability_zone = var.availability_zones[count.index]
  tags = {
    Name = format("dy-private-subnet-%d", count.index + 1)
  }
}