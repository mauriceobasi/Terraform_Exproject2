# Production Environment Variables
vpc_name                 = "prod-vpc"
vpc_cidr                 = "10.1.0.0/16"
public_subnet_count      = 3
private_subnet_count     = 3
public_subnet_cidrs      = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24"]
private_subnet_cidrs     = ["10.1.4.0/24", "10.1.5.0/24", "10.1.6.0/24"]
availability_zones       = ["us-east-1a", "us-east-1b", "us-east-1c"]
environment              = "prod"
publicly_accessible       = false
security_group_ids       = ["sg-12345678", "sg-87654321"]  # Replace with actual security group IDs

ami_id                   = "ami-0123456789abcdef0"  # Replace with actual AMI ID
instance_type            = "t3.medium"
key_name                 = "prod-keypair"
min_size                 = 2
max_size                 = 5
desired_capacity         = 3
allocated_storage         = 20
db_instance_identifier   = "prod-db-instance"
db_engine                = "mysql"
engine_version           = "8.0"
rds_instance_class       = "db.t3.micro"
master_username          = "admin"
master_password          = "YourSecureProdPassword!"  # Change this to a secure password
storage_type             = "gp2"
alb_security_group_id    = "sg-23456789"  # Replace with your ALB security group ID
