variable "ami_id" {
  description = "AMI ID for the EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "Instance type for the Auto Scaling Group"
  type        = string
}

variable "key_name" {
  description = "SSH key name for instance access"
  type        = string
}

variable "security_group_ids" {
  description = "List of security group IDs for the instances"
  type        = list(string)
}

variable "min_size" {
  description = "Minimum size of the Auto Scaling Group"
  type        = number
}

variable "max_size" {
  description = "Maximum size of the Auto Scaling Group"
  type        = number
}

variable "desired_capacity" {
  description = "Desired number of instances in the Auto Scaling Group"
  type        = number
}

variable "subnet_ids" {
  description = "List of subnet IDs for the Auto Scaling Group"
  type        = list(string)
}

variable "root_volume_size" {
  description = "Size of the root volume in GiB"
  type        = number
  default     = 8  # Default size, can be overridden
}

variable "root_volume_type" {
  description = "Type of the root volume (e.g., gp2, io1)"
  type        = string
  default     = "gp2"  # Default type, can be overridden
}
