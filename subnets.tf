## create subnet

resource "aws_subnet" "my_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.subnet_cidr

  tags = {
    Name = "terraform_subnet"
  }
}
## create Route table 
resource "aws_route_table" "my_route" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = var.route_cidr
    gateway_id = aws_internet_gateway.terraform_igw.id
  }
  tags = {
    Name = "my_route"
  }
}

## association route table subnet

resource "aws_route_table_association" "rt_subnet" {
  subnet_id      = aws_subnet.my_subnet.id
  route_table_id = aws_route_table.my_route.id 
}
