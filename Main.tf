# VPC

resource "aws_vpc" "Project4-VPC" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "Project4-VPC"
  }
}


# Private Subnet

resource "aws_subnet" "Private-Subnet-1" {
  vpc_id     = aws_vpc.Project4-VPC.id
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "Private-Subnet-1"
  }
}


# Private Subnet

resource "aws_subnet" "Private-Subnet-2" {
  vpc_id     = aws_vpc.Project4-VPC.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Private-Subnet-2"
  }
}

# Private Subnet 

resource "aws_subnet" "Private-Subnet-3" {
  vpc_id     = aws_vpc.Project4-VPC.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "Private-Subnet-3"
  }
}

# Public Subnet

resource "aws_subnet" "Public-Subnet-1" {
  vpc_id     = aws_vpc.Project4-VPC.id
  cidr_block = "10.0.3.0/24"

  tags = {
    Name = "Public-Subnet-1"
  }
}

# Public Subnet

resource "aws_subnet" "Public-Subnet-2" {
  vpc_id     = aws_vpc.Project4-VPC.id
  cidr_block = "10.0.4.0/24"

  tags = {
    Name = "Public-Subnet-2"
  }
}

# Private Route Table

resource "aws_route_table" "Private-RT" {
  vpc_id = aws_vpc.Project4-VPC.id

  route = []

  tags = {
    Name = "Private-RT"
  }
}

# Public Route Table

resource "aws_route_table" "Public-RT" {
  vpc_id = aws_vpc.Project4-VPC.id

  route = []

  tags = {
    Name = "Public-RT"
  }
}

# Private RT association with Private Subnet

resource "aws_route_table_association" "Pri-Subnet-Asso-RT-1" {
  subnet_id      = aws_subnet.Private-Subnet-1.id
  route_table_id = aws_route_table.Private-RT.id
}

# Private RT association with Private Subnet

resource "aws_route_table_association" "Pri-Subnet-Asso-RT-2" {
  subnet_id      = aws_subnet.Private-Subnet-2.id
  route_table_id = aws_route_table.Private-RT.id
}

# Private RT association with Private Subnet

resource "aws_route_table_association" "Pri-Subnet-Asso-RT-3" {
  subnet_id      = aws_subnet.Private-Subnet-3.id
  route_table_id = aws_route_table.Private-RT.id
}

# Public RT association with Public Subnet

resource "aws_route_table_association" "Pub-Subnet-Asso-RT-1" {
  subnet_id      = aws_subnet.Public-Subnet-1.id
  route_table_id = aws_route_table.Public-RT.id
}

# Public RT association with Public Subnet

resource "aws_route_table_association" "Pub-Subnet-Asso-RT-2" {
  subnet_id      = aws_subnet.Public-Subnet-2.id
  route_table_id = aws_route_table.Public-RT.id
}


# Internet Gateway

resource "aws_internet_gateway" "Project4-IGW" {
  vpc_id = aws_vpc.Project4-VPC.id

  tags = {
    Name = "Project4-IGW"
  }
}

# IGW association with Public RT

resource "aws_route" "Pub-RT-IGW" {
  route_table_id            = aws_route_table.Public-RT.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.Project4-IGW.id
}


