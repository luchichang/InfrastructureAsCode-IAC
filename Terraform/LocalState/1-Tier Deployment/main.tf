# creating the VPC with the CIDR Value 
resource "aws_vpc" "splunk_vpc" {
  cidr_block       = var.cidr_block_value
  instance_tenancy = "default"

  tags = {
    Name = "splunk_vpc"
  }
}


#creating the Internet gateway and attaching it to the vpc
resource "aws_internet_gateway" "splunk_igw" {
  vpc_id = aws_vpc.splunk_vpc.id

  tags = {
    Name = "splunk_igw"
  }
}

#subnet1
resource "aws_subnet" "splunk_subnet1" {
  vpc_id     = aws_vpc.splunk_vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "splunk_subnet1"
  }
}

#subnet 2

resource "aws_subnet" "splunk_subnet2" {
  vpc_id     = aws_vpc.splunk_vpc.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "splunk_subnet2"
  }
}




