
output "aws_ami_id" {
  value = module.myapp-server.ami_id.id
}

output "ec2_public_ip" {
  value = module.myapp-server.mywebserver.public_ip
}
