variable "security_group_id" {
  description = "The security group ID to associate with the ALB"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs where the ALB will be deployed"
  type        = list(string)
}

variable "instance_ids" {
  description = "List of EC2 instance IDs to attach to the target group"
  type        = list(string)
}

variable "instance_count" {
  description = "Number of instances to attach to the target group"
  type        = number
}

variable "vpc_id" {
  description = "VPC ID where the ALB will be created"
  type        = string
}
