# VPC Example
resource “aws_vpc”  “vpc1” {
  cidr_block = “10.0.0.0/24”
  instance_tenancy = “default”
  enable_dns_support = “true”
  enable_dns_hostnames = “true”
  enable_classiclink = “”false
}

# Subnet
resource “aws_subnet” “sub1-pub” {
  vpc_id = “${aws_vpc.vpc1.id}”
  cidr_block = “10.0.0.1/24”
  map_public_ip_on_launch = “true”
  availability_zone = “us-east-1”
}

# Gateway
resource “aws_internet_gateway” “gw1” {
  vpc_id = “${aws_vpc.sub1-pub.id}”
}

# routing
resource “aws_route_table” “pub” {
  vpc_id = “${aws_vpc.sub1-pub.id}”
  route {
    cidr_block = “0.0.0.0/0”
    gateway_id = “${aws_internet_gateway.gw1.id}”
  }
}

# route associations public
resource “aws_route_table_association” “pub1” {
  subnet_id = “${aws_subnet.sub1-pub.id}”
  route_table_id = “${aws_route_table.pub.id}”
}
