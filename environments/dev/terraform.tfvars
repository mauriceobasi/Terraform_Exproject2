# Development Environment Variables
vpc_name                 = "dev-vpc"
vpc_cidr                 = "10.2.0.0/16"
public_subnet_count      = 2
private_subnet_count     = 2
public_subnet_cidrs      = ["10.2.1.0/24", "10.2.2.0/24"]
private_subnet_cidrs     = ["10.2.3.0/24", "10.2.4.0/24"]
availability_zones       = ["us-east-1a", "us-east-1b"]
environment              = "dev"
publicly_accessible       = true
security_group_ids       = ["sg-12345678"]  # Replace with actual security group IDs

ami_id                   = "ami-0123456789abcdef0"  # Replace with actual AMI ID
instance_type            = "t3.small"
key_name                 = "dev-keypair"
min_size                 = 1
max_size                 = 3
desired_capacity         = 2
allocated_storage         = 20
db_instance_identifier   = "dev-db-instance"
db_engine                = "mysql"
engine_version           = "8.0"
rds_instance_class       = "db.t3.micro"
master_username          = "admin"
master_password          = "YourSecureDevPassword!"  # Change this to a secure password
storage_type             = "gp2"
alb_security_group_id    = "sg-23456789"  # Replace with your ALB security group ID
