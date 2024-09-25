variable "db_instance_identifier" {
  description = "The name of the database instance"
  type        = string
}

variable "engine" {
  description = "The database engine to use (e.g., postgres, mysql)"
  type        = string
}

variable "engine_version" {
  description = "The version of the database engine"
  type        = string
}

variable "instance_class" {
  description = "The instance class for the RDS instance"
  type        = string
}

variable "allocated_storage" {
  description = "The allocated storage size in GB"
  type        = number
}

variable "storage_type" {
  description = "The storage type for the database instance"
  type        = string
}

variable "master_username" {
  description = "The master username for the database"
  type        = string
}

variable "master_password" {
  description = "The master password for the database"
  type        = string
  sensitive   = true  # Mark as sensitive to avoid logging
}

variable "subnet_ids" {
  description = "The list of subnet IDs for the RDS instance"
  type        = list(string)
}

variable "security_group_ids" {
  description = "The list of security group IDs for the RDS instance"
  type        = list(string)
}

variable "publicly_accessible" {
  description = "Set to true if the RDS instance should be publicly accessible"
  type        = bool
}

variable "environment" {
  description = "The environment (e.g., dev, prod)"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC where the RDS instance will be deployed"
  type        = string
}
