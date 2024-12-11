variable "aws_region" {
 description = "AWS region to deploy resources in"
}


variable "vpc_cidr" {
 description = "CIDR block for the VPC"
}


variable "vpc_name" {
 description = "Name for the VPC"
}


variable "public_subnet_cidr1" {
 description = "CIDR block for the first public subnet"
}


variable "public_subnet_name1" {
 description = "Name for the first public subnet"
}


variable "public_subnet_az1" {
 description = "Availability zone for the first public subnet"
}


variable "public_subnet_cidr2" {
 description = "CIDR block for the second public subnet"
}


variable "public_subnet_name2" {
 description = "Name for the second public subnet"
}


variable "public_subnet_az2" {
 description = "Availability zone for the second public subnet"
}


variable "private_subnet_cidr1" {
 description = "CIDR block for the first private subnet"
}


variable "private_subnet_name1" {
 description = "Name for the first private subnet"
}


variable "private_subnet_az1" {
 description = "Availability zone for the first private subnet"
}


variable "private_subnet_cidr2" {
 description = "CIDR block for the second private subnet"
}


variable "private_subnet_name2" {
 description = "Name for the second private subnet"
}


variable "private_subnet_az2" {
 description = "Availability zone for the second private subnet"
}


variable "internet_gateway_name" {
 description = "Name for the Internet Gateway"
}


variable "public_route_table_name" {
 description = "Name for the public route table"
}


variable "nat_gateway_name" {
 description = "Name for the NAT Gateway"
}


variable "private_route_table_name" {
 description = "Name for the private route table"
}
