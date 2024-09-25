variable "public_subnet_id" {
  description = "The ID of the public subnet where the NAT Gateway will reside"
  type        = string
}

variable "private_subnet_id" {
  description = "The ID of the private subnet that will use the NAT Gateway"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC where the NAT Gateway and route table will be created"
  type        = string
}

variable "environment" {
  description = "The environment (e.g., dev, prod)"
  type        = string
}
