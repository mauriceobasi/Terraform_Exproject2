aws_region               = "us-east-1"
vpc_name                 = "my-vpc"
vpc_cidr                 = "10.0.0.0/16"
public_subnet_count      = 2
private_subnet_count     = 2
public_subnet_cidrs      = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs     = ["10.0.3.0/24", "10.0.4.0/24"]
availability_zones       = ["us-east-1a", "us-east-1b"]
environment              = "dev"
publicly_accessible       = false
security_group_ids       = ["sg-12345678"]  # Update with your security group ID
allocated_storage          = 20
db_engine                  = "mysql"
engine_version            = "8.0"
rds_instance_class        = "db.t3.micro"
db_username               = "admin"
db_password               = "YourSecurePassword123!"
db_instance_identifier     = "mydbinstance"
storage_type              = "gp2"
alb_security_group_id     = "sg-123456"  # Replace with your security group ID
instance_type = "t2.micro"  # Change as per your requirements

# New variables for Auto Scaling Group
ami_id                    = "ami-0123456789abcdef0"  # Replace with your AMI ID
key_name                  = "your-key-name"           # Replace with your key name
min_size                  = 1                           # Minimum instances in the ASG
max_size                  = 3                           # Maximum instances in the ASG
desired_capacity          = 2                           # Desired instances in the ASG

