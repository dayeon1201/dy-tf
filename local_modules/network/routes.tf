resource "aws_route_table" "dy_public_rt" {
  vpc_id = aws_vpc.dy_vpc.id # VPC와 라우팅 테이블 연결
  tags = {
    Name = "dy-public-rt"
  }
}

resource "aws_route_table" "dy_private_rt" {
  vpc_id = aws_vpc.dy_vpc.id
  tags = {
    Name = "dy-private-rt"
  }
}

resource "aws_route" "public_route" {
  route_table_id         = aws_route_table.dy_public_rt.id
  destination_cidr_block = "0.0.0.0/0" # 모든 트래픽을 인터넷으로 라우팅
  gateway_id             = aws_internet_gateway.dy_igw.id
}

resource "aws_route_table_association" "public_subnet_association" {
  count          = length(aws_subnet.dy_public_subnet) # 퍼블릭 서브넷 수
  subnet_id      = aws_subnet.dy_public_subnet[count.index].id
  route_table_id = aws_route_table.dy_public_rt.id # 퍼블릭 라우팅 테이블 ID
}

resource "aws_route" "private_route" {
  route_table_id         = aws_route_table.dy_private_rt.id
  destination_cidr_block = "0.0.0.0/0" # 모든 트래픽을 NAT 게이트웨이로 라우팅
  nat_gateway_id         = aws_nat_gateway.dy_nat_gw.id
}

resource "aws_route_table_association" "private_subnet_association" {
  count          = length(aws_subnet.dy_private_subnet)
  subnet_id      = aws_subnet.dy_private_subnet[count.index].id
  route_table_id = aws_route_table.dy_private_rt.id
}
