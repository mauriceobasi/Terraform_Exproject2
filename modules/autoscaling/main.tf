resource "aws_launch_configuration" "example" {
  name          = "example-launch-configuration"
  image_id     = var.ami_id                       # AMI ID for the instance
  instance_type = var.instance_type               # Instance type for the ASG
  key_name      = var.key_name                    # SSH key name for access

  # Security Groups
  security_groups = var.security_group_ids

  root_block_device {
    volume_size           = var.root_volume_size   # Size of the root volume in GiB
    volume_type           = var.root_volume_type   # Volume type (e.g., "gp2")
    delete_on_termination = true                    # Delete volume on instance termination
  }

  lifecycle {
    create_before_destroy = true                    # Prevents downtime during updates
  }
}

resource "aws_autoscaling_group" "example" {
  launch_configuration = aws_launch_configuration.example.id
  min_size            = var.min_size               # Minimum number of instances
  max_size            = var.max_size               # Maximum number of instances
  desired_capacity    = var.desired_capacity       # Desired number of instances

  vpc_zone_identifier = var.subnet_ids             # Subnets for the ASG

  # Define tags using tag blocks
  tag {
    key                 = "Name"
    value               = "example-asg-instance"
    propagate_at_launch = true
  }

  health_check_type          = "EC2"
  health_check_grace_period  = 300  # Seconds
}

resource "aws_autoscaling_policy" "scale_up" {
  name                   = "scale_up"
  scaling_adjustment      = 1          # Adjust as needed
  adjustment_type        = "ChangeInCapacity"
  autoscaling_group_name  = aws_autoscaling_group.example.name
}

resource "aws_autoscaling_policy" "scale_down" {
  name                   = "scale_down"
  scaling_adjustment      = -1         # Adjust as needed
  adjustment_type        = "ChangeInCapacity"
  autoscaling_group_name  = aws_autoscaling_group.example.name
}

# Optional: CloudWatch alarm for scaling policies
resource "aws_cloudwatch_metric_alarm" "cpu_high" {
  alarm_name          = "cpu_high_alarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "2"
  metric_name        = "CPUUtilization"
  namespace          = "AWS/EC2"
  period             = "60"
  statistic          = "Average"
  threshold          = 75                      # Adjust threshold as needed
  alarm_actions      = [aws_autoscaling_policy.scale_up.arn]

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.example.name
  }
}

resource "aws_cloudwatch_metric_alarm" "cpu_low" {
  alarm_name          = "cpu_low_alarm"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = "2"
  metric_name        = "CPUUtilization"
  namespace          = "AWS/EC2"
  period             = "60"
  statistic          = "Average"
  threshold          = 25                      # Adjust threshold as needed
  alarm_actions      = [aws_autoscaling_policy.scale_down.arn]

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.example.name
  }
}
