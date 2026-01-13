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
    Name                                = "${var.env}-sub_public_1"
    Env                                 = var.env
    "kubernetes.io/cluster/dev-cluster" = "shared"
  }

}

resource "aws_subnet" "public_2" {
  vpc_id                  = aws_vpc.main.id
  map_public_ip_on_launch = true
  availability_zone       = var.az_1b
  cidr_block              = var.cidr_block_s2

  tags = {
    Name                                = "${var.env}-sub_public2"
    Env                                 = var.env
    "kubernetes.io/cluster/dev-cluster" = "shared"
  }

}

# PRIVATE SUBNET
resource "aws_subnet" "private_1" {
  vpc_id            = aws_vpc.main.id
  availability_zone = var.az_1a
  cidr_block        = var.cidr_block_sp1

  tags = {
    Name                                = "${var.env}-sub_private1"
    Env                                 = var.env
    "kubernetes.io/cluster/dev-cluster" = "shared"
  }

}

resource "aws_subnet" "private_2" {
  vpc_id            = aws_vpc.main.id
  availability_zone = var.az_1b
  cidr_block        = var.cidr_block_sp2

  tags = {
    Name                                = "${var.env}-sub_private2"
    Env                                 = var.env
    "kubernetes.io/cluster/dev-cluster" = "shared"
  }

}

resource "aws_subnet" "private_3" {
  vpc_id            = aws_vpc.main.id
  availability_zone = var.az_1c
  cidr_block        = var.cidr_block_sp3

  tags = {
    Name                                = "${var.env}-sub_private3"
    Env                                 = var.env
    "kubernetes.io/cluster/dev-cluster" = "shared"
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
#NAT GATEWAY
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.public_1.id

  tags = {
    Name = "${var.env}-NAT"
    Env  = var.env
  }

  depends_on = [aws_internet_gateway.gateway]

}
#EIP FOR NAT
resource "aws_eip" "eip" {

  tags = {
    Name = "${var.env}-EIP-NAT"
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

resource "aws_route_table" "priv" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.env}-RT"
    Env  = var.env
  }
}

resource "aws_route" "private" {
  route_table_id         = aws_route_table.priv.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat.id
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

resource "aws_route_table_association" "private_1" {
  subnet_id      = aws_subnet.private_1.id
  route_table_id = aws_route_table.priv.id
}

resource "aws_route_table_association" "private_2" {
  subnet_id      = aws_subnet.private_2.id
  route_table_id = aws_route_table.priv.id
}

resource "aws_route_table_association" "private_3" {
  subnet_id      = aws_subnet.private_3.id
  route_table_id = aws_route_table.priv.id
}