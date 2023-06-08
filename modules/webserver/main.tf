#  using deafult security group created by vpc

resource "aws_default_security_group" "myapp-default-sg" {
  vpc_id = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    prefix_list_ids = []
  }

  tags = {
    Name = "${var.environment}-default-sg"
  }

}

data "aws_ami" "latest-linux-image" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = [var.image_name]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]

  }
}



resource "aws_key_pair" "myapp-ssh-key-pair" {
  key_name   = "${var.environment}-key"
  # public_key = var.id_rsa
  public_key = file(var.public_key_location)
}

resource "aws_instance" "myapp-server" {
  ami                         = data.aws_ami.latest-linux-image.id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [aws_default_security_group.myapp-default-sg.id]
  availability_zone           = var.subnet_avail_zone
  associate_public_ip_address = true
  key_name                    = aws_key_pair.myapp-ssh-key-pair.key_name


  user_data = file("entry-script.sh")

  tags = {
    Name = "${var.environment}-server"
  }
}



