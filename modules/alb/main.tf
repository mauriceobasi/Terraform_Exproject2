resource "aws_lb" "main" {
  name               = "my-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.security_group_id]
  subnets            = var.subnet_ids

  enable_deletion_protection = false  # Set to true if you want to prevent accidental deletion

  tags = {
    Name = "my-alb"
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.main.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "forward"

    target_group_arn = aws_lb_target_group.main.arn
  }
}

resource "aws_lb_target_group" "main" {
  name     = "my-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id  # Pass the VPC ID if needed

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold  = 2
    unhealthy_threshold = 2
  }

  tags = {
    Name = "my-target-group"
  }
}

resource "aws_lb_target_group_attachment" "example" {
  count             = var.instance_count  # Pass the number of instances
  target_group_arn = aws_lb_target_group.main.arn
  target_id        = element(var.instance_ids, count.index)  # Instance IDs to attach
  port             = 80
}
