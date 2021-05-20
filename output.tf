output "vpc-id" {
  value = module.vpc.vpc-id
}
output "public-subnets" {
  value = module.vpc.public-subnets
}
output "instance-security-group-id" {
  value = module.vpc.instance-security-group-id
}
output "alb-security-group-id" {
  value = module.vpc.alb-security-group-id
}
