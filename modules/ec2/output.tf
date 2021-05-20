output "private_ip" {
  value = aws_instance.ec2_instance.private_ip
}

output "public_ip" {
  value = aws_instance.ec2_instance.public_ip
}

output "ec2-instance-id" {
  value = aws_instance.ec2_instance.id

}