output "mywebserver" {
  value = aws_instance.myapp-server
}

output "ami_id" {
  value = data.aws_ami.latest-linux-image
}