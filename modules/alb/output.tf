output "alb-id" {
  value = aws_lb.alb.id
}

output "alb-dns" {
  value = aws_lb.alb.dns_name
}

output "alb-zone-id" {
  value = aws_lb.alb.zone_id
}

output "targetgroup-arn" {
  value = aws_lb_target_group.alb-target-group.arn
}
