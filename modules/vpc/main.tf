# Declare the data source
data "aws_availability_zones" "available" {
  state = "available"
}
locals {
  az_length = data.aws_availability_zones.available.names
}
# Internet VPC
resource "aws_vpc" "vpc" {
  cidr_block           = var.VPC_CIDR
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  tags = {
    Name = "${terraform.workspace}-${var.NAME}"
  }
}

# Subnets
resource "aws_subnet" "public-subnets" {
  count                   = length(var.PUBLIC_SUBNET)
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.PUBLIC_SUBNET[count.index]
  map_public_ip_on_launch = "true"
  availability_zone       = count.index + 1 <= length(local.az_length) ? local.az_length[count.index + 1] : null

  tags = {
    Name = "${terraform.workspace}-${var.NAME}-public-subnet-${count.index}"
  }
}



# Internet GW
resource "aws_internet_gateway" "vpc-gw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${terraform.workspace}-${var.NAME}-gw"
  }
}

# public route tables
resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vpc-gw.id
  }

  tags = {
    Name = "${terraform.workspace}-${var.NAME}-public-route-table"
  }
}
# VPC setup for NAT

# route associations public
resource "aws_route_table_association" "public-subnets" {
  count          = length(var.PUBLIC_SUBNET)
  subnet_id      = aws_subnet.public-subnets[count.index].id
  route_table_id = aws_route_table.public-route-table.id
}
