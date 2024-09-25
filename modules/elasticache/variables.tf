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

variable "security_group_ids" {
  description = "List of security group IDs to associate with the ElastiCache"
  type        = list(string)
}

variable "subnet_ids" {
  description = "List of subnet IDs for the ElastiCache subnet group"
  type        = list(string)
}

variable "environment" {
  description = "Deployment environment (e.g., dev, staging, prod)"
  type        = string
}
