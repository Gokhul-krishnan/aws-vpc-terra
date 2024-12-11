provider "aws" {
 region = var.aws_region
}


# Create a VPC
resource "aws_vpc" "main" {
 cidr_block = var.vpc_cidr
 tags = {
   Name = var.vpc_name
 }
}


# Create public subnets
resource "aws_subnet" "public1" {
 vpc_id            = aws_vpc.main.id
 cidr_block        = var.public_subnet_cidr1
 availability_zone = var.public_subnet_az1
 tags = {
   Name = var.public_subnet_name1
 }
}


resource "aws_subnet" "public2" {
 vpc_id            = aws_vpc.main.id
 cidr_block        = var.public_subnet_cidr2
 availability_zone = var.public_subnet_az2
 tags = {
   Name = var.public_subnet_name2
 }
}


# Create private subnets
resource "aws_subnet" "private1" {
 vpc_id            = aws_vpc.main.id
 cidr_block        = var.private_subnet_cidr1
 availability_zone = var.private_subnet_az1
 tags = {
   Name = var.private_subnet_name1
 }
}


resource "aws_subnet" "private2" {
 vpc_id            = aws_vpc.main.id
 cidr_block        = var.private_subnet_cidr2
 availability_zone = var.private_subnet_az2
 tags = {
   Name = var.private_subnet_name2
 }
}


# Create an Internet Gateway
resource "aws_internet_gateway" "igw" {
 vpc_id = aws_vpc.main.id
 tags = {
   Name = var.internet_gateway_name
 }
}


# Create public route table
resource "aws_route_table" "public" {
 vpc_id = aws_vpc.main.id


 route {
   cidr_block = "0.0.0.0/0"
   gateway_id = aws_internet_gateway.igw.id
 }


 tags = {
   Name = var.public_route_table_name
 }
}


# Associate public subnets with the public route table
resource "aws_route_table_association" "public1" {
 subnet_id      = aws_subnet.public1.id
 route_table_id = aws_route_table.public.id
}


resource "aws_route_table_association" "public2" {
 subnet_id      = aws_subnet.public2.id
 route_table_id = aws_route_table.public.id
}


# Create a NAT Gateway
resource "aws_eip" "nat" {
 domain = "vpc"
}


resource "aws_nat_gateway" "nat" {
 allocation_id = aws_eip.nat.id
 subnet_id     = aws_subnet.public1.id
 tags = {
   Name = var.nat_gateway_name
 }
}


# Create private route table
resource "aws_route_table" "private" {
 vpc_id = aws_vpc.main.id


 route {
   cidr_block     = "0.0.0.0/0"
   nat_gateway_id = aws_nat_gateway.nat.id
 }


 tags = {
   Name = var.private_route_table_name
 }
}


# Associate private subnets with the private route table
resource "aws_route_table_association" "private1" {
 subnet_id      = aws_subnet.private1.id
 route_table_id = aws_route_table.private.id
}


resource "aws_route_table_association" "private2" {
 subnet_id      = aws_subnet.private2.id
 route_table_id = aws_route_table.private.id
}
