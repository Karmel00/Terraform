# VPC
resource "aws_vpc" "main" {
  cidr_block = var.cidr_block

  tags = {
    Name = "${var.env}-vpc"
    Env  = var.env
  }

}

# PUBLIC SUBNET
resource "aws_subnet" "public_1" {
  vpc_id                  = aws_vpc.main.id
  map_public_ip_on_launch = true
  availability_zone       = var.az_1a
  cidr_block              = var.cidr_block_s1

  tags = {
    Name = "${var.env}-sub_public_1"
    Env  = var.env
  }

}

resource "aws_subnet" "public_2" {
  vpc_id                  = aws_vpc.main.id
  map_public_ip_on_launch = true
  availability_zone       = var.az_1b
  cidr_block              = var.cidr_block_s2

  tags = {
    Name = "${var.env}-sub_public2"
    Env  = var.env
  }

}

# INTERNET GATEWAY
resource "aws_internet_gateway" "gateway" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.env}-IGW"
    Env  = var.env
  }

}

#ROUTE_TABLE/ROUTE
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.env}-RT"
    Env  = var.env
  }

}

resource "aws_route" "public" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.gateway.id
}

#RT_ASSOCIATION
resource "aws_route_table_association" "public_1" {
  subnet_id      = aws_subnet.public_1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_2" {
  subnet_id      = aws_subnet.public_2.id
  route_table_id = aws_route_table.public.id
}