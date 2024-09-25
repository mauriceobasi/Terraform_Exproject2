resource "aws_elasticache_cluster" "this" {
  cluster_id           = var.elasticache_cluster_id
  engine               = var.elasticache_engine
  node_type            = var.elasticache_node_type
  num_cache_nodes      = var.num_cache_nodes
  parameter_group_name = var.parameter_group_name
  port                 = var.port
  subnet_group_name    = aws_elasticache_subnet_group.this.name
  security_group_ids   = var.security_group_ids

  tags = {
    Name        = "ElastiCache-${var.environment}"
    Environment = var.environment
  }
}

resource "aws_elasticache_subnet_group" "this" {
  name       = "${var.environment}-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name        = "ElastiCacheSubnetGroup-${var.environment}"
    Environment = var.environment
  }
}
