resource "aws_cloudfront_distribution" "cdn" {
  origin {
    domain_name = aws_s3_bucket.static_content.bucket_regional_domain_name
    origin_id   = "S3Origin"

    # Optional: Restrict access to S3 bucket using Origin Access Identity (OAI)
    # origin_access_identity = aws_cloudfront_origin_access_identity.oai.id
  }

  default_cache_behavior {
    target_origin_id = "S3Origin"
    
    viewer_protocol_policy = "redirect-to-https"
    allowed_methods       = ["GET", "HEAD"]

    # Optional: Cache settings
    cached_methods        = ["GET", "HEAD"]
    min_ttl              = 0
    default_ttl          = 300
    max_ttl              = 600

    # Optional: Set response headers (CORS, etc.)
    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }
  }

  enabled             = true
  is_ipv6_enabled     = true
  comment             = "CloudFront Distribution for S3 bucket"
  price_class         = "PriceClass_All"

  # Default root object for the distribution (optional)
  default_root_object = "index.html"

  # Optional: Configure SSL
  viewer_certificate {
    cloudfront_default_certificate = true
    # Alternatively, you can use a custom certificate
    # acm_certificate_arn = var.acm_certificate_arn
    # ssl_support_method = "sni-only"
  }

  # Required: Restrictions block
  restrictions {
    geo_restriction {
      restriction_type = "none"  # Set to "none", "whitelist", or "blacklist"
      locations        = []        # Add country codes if using "whitelist" or "blacklist"
    }
  }

  tags = {
    Name        = "CloudFrontDistribution"
    Environment = var.environment
  }
}
