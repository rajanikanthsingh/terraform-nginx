resource "aws_lb" "alb" {
  name               = "${terraform.workspace}-${var.NAME}-ALB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.alb-security-group-id]
  subnets            = var.public-subnets

  enable_deletion_protection = false
}
resource "aws_lb_target_group" "alb-target-group" {
  name     = "${terraform.workspace}-${var.NAME}-TargetGroup"
  port     = "80"
  protocol = "HTTP"
  vpc_id   = var.vpc-id
  health_check {
    healthy_threshold   = 3
    unhealthy_threshold = 10
    timeout             = 5
    interval            = 10
    path                = "/"
    port                = "80"
  }
}
resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb-target-group.arn
  }
}

resource "aws_lb_target_group_attachment" "test1" {
  target_group_arn = aws_lb_target_group.alb-target-group.arn
  target_id        = var.ec2-instance-id_1
  port             = 80
}

resource "aws_lb_target_group_attachment" "test2" {
  target_group_arn = aws_lb_target_group.alb-target-group.arn
  target_id        = var.ec2-instance-id_2
  port             = 80
}