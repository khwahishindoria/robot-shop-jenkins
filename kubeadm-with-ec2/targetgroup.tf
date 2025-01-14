resource "aws_lb_target_group" "tg-master" {
  name        = "master-node-tg"
  target_type = "instance"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.prod-vpc.id
}

resource "aws_lb_target_group_attachment" "test" {
  target_group_arn = aws_lb_target_group.tg-master.arn
  target_id        = aws_instance.master-node.id
  port             = 31599
}