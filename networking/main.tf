#variables 

variable "vpc_cidr" {}
variable "vpc_name" {}
variable "public_subnets" {}
variable "ap_availability_zone" {}
variable "private_subnets" {}

#outputs

output "dev_proj_1_ap_south_1" {
    value = aws_vpc.dev_proj_1_ap_south_1.id
  
}

output "dev_proj_1_public_subnets" {
    value = aws_subnet.dev_proj_1_public_subnets.*.id
}

output "public_subnet_cidr_block" {
  value = aws_subnet.dev_proj_1_public_subnets.*.cidr_block
}



#localvariable

locals {
  Name = "dev-project-1"
}


#SetupVPC

resource "aws_vpc" "dev_proj_1_ap_south_1" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = local.Name
  }
}


# Setup public subnets
resource "aws_subnet" "dev_proj_1_public_subnets" {
    vpc_id = aws_vpc.dev_proj_1_ap_south_1.id
    count = length(var.public_subnets)
    cidr_block = element(var.public_subnets, count.index)
    availability_zone = element(var.ap_availability_zone, count.index)

    tags = {
    Name = var.vpc_name
  }
}


#Setup private subnets
resource "aws_subnet" "dev_proj_1_private_subnets" {
    vpc_id = aws_vpc.dev_proj_1_ap_south_1.id
    count = length(var.private_subnets)
    cidr_block = element(var.private_subnets, count.index)
    availability_zone = element(var.ap_availability_zone, count.index)

    tags = {
    Name = var.vpc_name
  }
}

#Setup internet getway

resource "aws_internet_gateway" "dev_proj_1_internet_getway" {
  vpc_id = aws_vpc.dev_proj_1_ap_south_1.id

  tags = {
    Name = "main"
  }
}

#setup public route table

resource "aws_route_table" "dev_proj_1_public_route_table" {
  vpc_id = aws_vpc.dev_proj_1_ap_south_1.id

  route {
    cidr_block = "0.0.0.0./0"
    gateway_id = aws_internet_gateway.dev_proj_1_internet_getway
  }
  
  tags = {
    Name = "example"
  }
}

# public route table and public subnet association 

resource "aws_route_table_association" "dev_proj_1_public_rt_subnet_assosation" {
  count = length(aws_subnet.dev_proj_1_public_subnets)
  subnet_id      = aws_subnet.dev_proj_1_public_subnets[count.index].id
  route_table_id = aws_route_table.dev_proj_1_public_route_table.id
}


#setup  private route table

resource "aws_route_table" "dev_proj_1_private_route_table" {
  vpc_id = aws_vpc.dev_proj_1_ap_south_1.id

  route {
    cidr_block = "0.0.0.0./0"
    #depends_on = [aws_nat_gateway.nat_gateway]

  }
  
  tags = {
    Name = "example"
  }
}

# private route table and private subnet association 

resource "aws_route_table_association" "dev_proj_1_private_rt_subnet_assosation" {
  count = length(aws_subnet.dev_proj_1_private_subnets)
  subnet_id      = aws_subnet.dev_proj_1_private_subnets[count.index].id
  route_table_id = aws_route_table.dev_proj_1_private_route_table.id
}

