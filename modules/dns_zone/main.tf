resource "aws_route53_zone" "private" {
  name = "smoothiemachine.local"

  vpc {
    vpc_id = var.vpc_id
  }
}

resource "aws_route53_record" "www1" {
  zone_id = aws_route53_zone.private.zone_id
  name    = "Web0.smoothiemachine.local"
  type    = "A"
  ttl     = "300"
  records = [var.ec2_instance_1_ip]
}

resource "aws_route53_record" "www2" {
  zone_id = aws_route53_zone.private.zone_id
  name    = "web1.smoothiemachine.local"
  type    = "A"
  ttl     = "300"
  records = [var.ec2_instance_2_ip]
}

resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.private.zone_id
  name    = "dh.smoothiemachine.local"
  type    = "A"

  alias {
    name                   = var.dns_name
    zone_id                = var.alb_zone_id
    evaluate_target_health = true
  }
}	
