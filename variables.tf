variable "aws_region" {
  description = "The AWS region to deploy resources."
  type        = string
}

variable "vpc_name" {
  description = "Name of the VPC."
  type        = string
}


variable "vpc_id" {
  description = "The ID of the VPC where the ALB will be created"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
}

variable "public_subnet_count" {
  description = "Number of public subnets."
  type        = number
}

variable "private_subnet_count" {
  description = "Number of private subnets."
  type        = number
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets."
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets."
  type        = list(string)
}


variable "availability_zones" {
  description = "List of availability zones."
  type        = list(string)
}

variable "environment" {
  description = "Deployment environment (e.g., dev, prod)."
  type        = string
}

variable "publicly_accessible" {
  description = "Whether the RDS instance is publicly accessible."
  type        = bool
}

variable "allocated_storage" {
  description = "The allocated storage in gigabytes."
  type        = number
}

variable "db_engine" {
  description = "The database engine to use (e.g., mysql, postgres)."
  type        = string
}

variable "engine_version" {
  description = "The engine version."
  type        = string
}

variable "rds_instance_class" {
  description = "The instance class for the RDS."
  type        = string
}

variable "db_username" {
  description = "The master username for the database."
  type        = string
}

variable "db_password" {
  description = "The master password for the database."
  type        = string
  sensitive   = true
}

variable "db_instance_identifier" {
  description = "The DB instance identifier."
  type        = string
}

variable "storage_type" {
  description = "The storage type (e.g., standard, gp2)."
  type        = string
}

variable "alb_security_group_id" {
  description = "The security group ID for the ALB."
  type        = string
}

variable "instance_count" {
  description = "The number of instances to attach to the target group."
  type        = number
}

variable "instance_ids" {
  description = "A list of instance IDs to attach to the target group."
  type        = list(string)
}

variable "instance_type" {
  description = "The EC2 instance type for the Auto Scaling Group"
  type        = string
  default     = "t2.micro"  # Or any instance type of your choice
}

variable "ami_id" {
  description = "AMI ID for the EC2 instances"
  type        = string
}

variable "key_name" {
  description = "The name of the SSH key pair"
  type        = string
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

variable "security_group_ids" {
  description = "List of security group IDs to associate with the VPC"
  type        = list(string)
}

variable "master_username" {
  description = "Master username for the RDS instance"
  type        = string
}

variable "master_password" {
  description = "Master password for the RDS instance"
  type        = string
}

variable "s3_bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "elasticache_cluster_id" {
  description = "The name of the ElastiCache cluster"
  type        = string
}

variable "elasticache_engine" {
  description = "The engine for the ElastiCache cluster (e.g., redis, memcached)"
  type        = string
}

variable "elasticache_node_type" {
  description = "The type of node for the ElastiCache cluster"
  type        = string
}

variable "num_cache_nodes" {
  description = "The number of cache nodes to create in the cluster"
  type        = number
}

variable "parameter_group_name" {
  description = "The name of the parameter group"
  type        = string
}

variable "port" {
  description = "The port number for the cache nodes"
  type        = number
  default     = 6379  # Default for Redis
}

variable "subnet_group_name" {
  description = "The name of the subnet group"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for the ElastiCache subnet group"
  type        = list(string)
}

# variables.tf in VPC module
variable "publicly_accessible" {
  description = "Whether the resources should be publicly accessible."
  type        = bool
  default     = false
}