output "vpc-id" {
  value = aws_vpc.vpc.id
}
output "public-subnets" {
  value = aws_subnet.public-subnets.*.id
}

output "public_subnet_1" {
  value = aws_subnet.public-subnets[0].id

}

output "public_subnet_2" {
  value = aws_subnet.public-subnets[1].id

}

output "instance-security-group-id" {
  value = aws_security_group.instance-security-group.id
}
output "alb-security-group-id" {
  value = aws_security_group.alb-security-group.id
}

