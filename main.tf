module "vpc" {
  source              = "./modules/vpc"
  vpc_name            = var.vpc_name
  vpc_cidr            = var.vpc_cidr
  public_subnet_count = var.public_subnet_count
  private_subnet_count = var.private_subnet_count
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones   = var.availability_zones
  environment          = var.environment
  publicly_accessible  = var.publicly_accessible      # Ensure this variable is defined
  security_group_ids   = var.security_group_ids       # Ensure this variable is defined
}


# NAT Gateway for private subnets' outbound internet access
module "nat_gateway" {
  source            = "./modules/nat_gateway"
  vpc_id            = module.vpc.vpc_id
  public_subnet_id  = module.vpc.public_subnet_ids[0]    # Use a single public subnet
  private_subnet_id = module.vpc.private_subnet_ids[0]   # Use a single private subnet
  environment       = var.environment                   # Add the required environment variable
}


module "rds" {
  source                   = "./modules/rds"
  db_instance_identifier   = var.db_instance_identifier
  engine                   = var.db_engine
  engine_version           = var.engine_version
  instance_class           = var.rds_instance_class
  allocated_storage        = var.allocated_storage
  storage_type             = var.storage_type
  master_username          = var.master_username
  master_password          = var.master_password
  subnet_ids               = module.vpc.private_subnet_ids
  security_group_ids       = var.security_group_ids
  publicly_accessible      = false # RDS should not be publicly accessible
  vpc_id                   = module.vpc.vpc_id
  environment              = var.environment
}

module "autoscaling" {
  source             = "./modules/autoscaling"
  subnet_ids         = module.vpc.private_subnet_ids
  security_group_ids = var.security_group_ids
  instance_type      = var.instance_type
  ami_id             = var.ami_id
  key_name           = var.key_name
  min_size           = var.min_size
  max_size           = var.max_size
  desired_capacity   = var.desired_capacity

 

module "alb" {
  source              = "./modules/alb"
  security_group_id   = var.alb_security_group_id
  subnet_ids          = module.vpc.public_subnet_ids
  vpc_id              = module.vpc.vpc_id

  # Load balancer listener setup
  listener = {
    port            = 80
    protocol        = "HTTP"
    target_group_arn = var.target_group_arn
  }
}

module "cloudfront_s3" {
  source          = "./modules/cloudfront_s3"
  bucket_name     = var.s3_bucket_name
  environment     = var.environment

  # CloudFront settings
  distribution_settings = {
    enabled             = true
    origin_access_identity = true
    viewer_protocol_policy = "redirect-to-https"
  }
}

module "elasticache" {
  source                  = "./modules/elasticache"
  elasticache_cluster_id  = var.elasticache_cluster_id
  elasticache_engine      = var.elasticache_engine       # e.g., "redis" or "memcached"
  elasticache_node_type   = var.elasticache_node_type    # e.g., "cache.t2.micro"
  num_cache_nodes         = var.num_cache_nodes
  parameter_group_name    = var.parameter_group_name
  subnet_group_name       = var.subnet_group_name
  subnet_ids              = module.vpc.private_subnet_ids  # Private subnets for ElastiCache
  security_group_ids      = var.security_group_ids
  environment             = var.environment
}

# Optional: Route 53 for DNS (if needed)
module "route53" {
  source  = "./modules/route53"
  domain_name = var.domain_name
  zone_id     = var.zone_id
}
