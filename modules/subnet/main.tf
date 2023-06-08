# Subnet
resource "aws_subnet" "myapp-subnet" {
  vpc_id            = var.vpc_id
  cidr_block        = var.subnet_cidr_block
  availability_zone = var.subnet_az

  tags = {
    Name = "${var.environment}-subnet-1"
  }
}

# gateway
resource "aws_internet_gateway" "my-app-igw" {
  vpc_id = var.vpc_id

  tags = {
    Name = "${var.environment}-igw"
  }
}

resource "aws_default_route_table" "myapp-default-rtb" {

  default_route_table_id = var.default_route_table_id

  # adding internet gatway
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my-app-igw.id
  }

  tags = {
    Name = "${var.environment}-main-rtb"
  }

}