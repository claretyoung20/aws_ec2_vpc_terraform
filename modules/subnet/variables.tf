variable "subnet_cidr_block" {
  default = "10.0.1.0/24"
}

variable "subnet_az" {
  default = "eu-west-1a"
}

variable "environment" {
  default = "dev"
}
variable "vpc_id" {}

variable "default_route_table_id" {}
