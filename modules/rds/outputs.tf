output "db_instance_id" {
  description = "The ID of the RDS instance"
  value       = aws_db_instance.default.id
}

output "db_instance_endpoint" {
  description = "The endpoint of the RDS instance"
  value       = aws_db_instance.default.endpoint
}

output "db_instance_port" {
  description = "The port on which the database is running"
  value       = aws_db_instance.default.port
}

output "db_subnet_group_id" {
  description = "The ID of the DB subnet group"
  value       = aws_db_subnet_group.default.id
}

output "db_subnet_group_name" {
  description = "The name of the DB subnet group"
  value       = aws_db_subnet_group.default.name
}

output "db_instance_status" {
  description = "The current status of the RDS instance"
  value       = aws_db_instance.default.db_instance_status
}
