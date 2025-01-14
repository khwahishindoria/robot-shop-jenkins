resource "aws_lb" "prod-alb" {
  name               = "prod-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.prod-vpc-SG.id]
  subnets            = [aws_subnet.prod-vpc_subnet1.id,aws_subnet.prod-vpc_subnet2.id]
  enable_deletion_protection = true
  tags = {
    Environment = "production"
  }
}


resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.prod-alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.tg-master.arn

    }
}