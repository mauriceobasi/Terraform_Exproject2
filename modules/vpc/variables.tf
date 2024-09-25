variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
}


variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_count" {
  description = "Number of public subnets"
  type        = number
}

variable "private_subnet_count" {
  description = "Number of private subnets"
  type        = number
}

variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for the public subnets"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for the private subnets"
  type        = list(string)
}

variable "availability_zones" {
  description = "List of availability zones for subnet placement"
  type        = list(string)
}

variable "environment" {
  description = "Deployment environment (e.g., dev, staging, prod)"
  type        = string
}

variable "publicly_accessible" {
  description = "Flag to indicate if the resources should be publicly accessible"
  type        = bool
}

variable "security_group_ids" {
  description = "List of security group IDs to associate with the VPC resources"
  type        = list(string)
}

# variables.tf in VPC module
variable "publicly_accessible" {
  description = "Whether the resources should be publicly accessible."
  type        = bool
  default     = false
}
