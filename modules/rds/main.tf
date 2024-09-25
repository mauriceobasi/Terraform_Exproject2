resource "aws_db_instance" "default" {
  identifier              = var.db_instance_identifier  # The name of the database instance
  engine                 = var.engine                   # Database engine (e.g., "postgres", "mysql")
  engine_version         = var.engine_version           # Specify the version of the database engine
  instance_class         = var.instance_class           # Instance type (e.g., "db.t2.micro")
  allocated_storage       = var.allocated_storage         # Size in GB
  storage_type           = var.storage_type             # Storage type (e.g., "gp2", "io1")
  db_subnet_group_name   = aws_db_subnet_group.default.name  # Reference to the subnet group
  vpc_security_group_ids  = var.security_group_ids      # Security groups for RDS

  username               = var.master_username           # Master username
  password               = var.master_password           # Master password
  skip_final_snapshot    = true                         # Set to false for production to create a final snapshot
  publicly_accessible     = var.publicly_accessible      # Set to true if RDS should be publicly accessible

  tags = {
    Name        = var.db_instance_identifier
    Environment = var.environment
  }
}

resource "aws_db_subnet_group" "default" {
  name       = "${var.db_instance_identifier}-subnet-group"  # Name for the subnet group
  subnet_ids = var.subnet_ids                         # Subnets for the RDS instance

  tags = {
    Name        = "${var.db_instance_identifier}-subnet-group"
    Environment = var.environment
  }
}

# Optional: Output the RDS instance details
output "rds_instance_endpoint" {
  description = "The connection endpoint for the RDS instance"
  value       = aws_db_instance.default.endpoint
}

output "rds_instance_id" {
  description = "The ID of the RDS instance"
  value       = aws_db_instance.default.id
}

output "rds_instance_arn" {
  description = "The ARN of the RDS instance"
  value       = aws_db_instance.default.arn
}
