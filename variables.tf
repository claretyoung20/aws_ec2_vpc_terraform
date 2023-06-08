variable "vpc_cidr_block" {
  default = "10.0.0.0/16"
}

variable "subnet_cidr_block" {
  default = "10.0.1.0/24"
}

variable "subnet_az" {
  default = "eu-west-1a"
}

variable "environment" {
  default = "dev"
}
variable "my_ip" {}

variable "instance_type" {}

variable "id_rsa" {}

variable "public_key_location" {}

variable "private_key_location" {}

variable "image_name" {}
