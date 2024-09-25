output "elasticache_endpoint" {
  description = "The endpoint of the ElastiCache cluster"
  value       = aws_elasticache_cluster.default.configuration_endpoint[0]
}

output "elasticache_port" {
  description = "The port of the ElastiCache cluster"
  value       = aws_elasticache_cluster.default.configuration_endpoint[1]
}

output "elasticache_id" {
  description = "The ID of the ElastiCache cluster"
  value       = aws_elasticache_cluster.default.id
}

output "elasticache_security_group_ids" {
  description = "The security group IDs associated with the ElastiCache cluster"
  value       = aws_elasticache_cluster.default.security_group_ids
}
