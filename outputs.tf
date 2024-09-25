# Outputs for the VPC Module
output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "List of public subnet IDs"
  value       = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "List of private subnet IDs"
  value       = module.vpc.private_subnet_ids
}

# Outputs for the ALB Module
output "alb_arn" {
  description = "The ARN of the Application Load Balancer"
  value       = module.alb.alb_arn
}

output "alb_dns_name" {
  description = "The DNS name of the Application Load Balancer"
  value       = module.alb.alb_dns_name
}

output "target_group_arn" {
  description = "The ARN of the target group"
  value       = module.alb.target_group_arn
}

output "target_group_id" {
  description = "The ID of the target group"
  value       = module.alb.target_group_id
}

# Outputs for the Auto Scaling Group Module
output "asg_instance_ids" {
  description = "List of EC2 instance IDs in the Auto Scaling Group"
  value       = module.autoscaling.instance_ids
}

# Outputs for the RDS Module
output "db_instance_endpoint" {
  description = "The endpoint of the RDS instance"
  value       = module.rds.db_instance_endpoint
}

output "db_instance_arn" {
  description = "The ARN of the RDS instance"
  value       = module.rds.db_instance_arn
}

# Outputs for the ElastiCache Module
output "cache_cluster_id" {
  description = "The ID of the ElastiCache cluster"
  value       = module.elasticache.cache_cluster_id
}

output "cache_cluster_endpoint" {
  description = "The endpoint of the ElastiCache cluster"
  value       = module.elasticache.cache_cluster_endpoint
}

# Outputs for the NAT Gateway Module
output "nat_gateway_id" {
  description = "The ID of the NAT Gateway"
  value       = module.nat_gateway.nat_gateway_id
}

output "nat_gateway_eip" {
  description = "The Elastic IP associated with the NAT Gateway"
  value       = module.nat_gateway.nat_gateway_eip
}
