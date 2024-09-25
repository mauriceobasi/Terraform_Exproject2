variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "environment" {
  description = "The environment (e.g., dev, prod)"
  type        = string
}

# Optional: For SSL certificate if you use a custom certificate
variable "acm_certificate_arn" {
  description = "The ARN of the ACM certificate for SSL"
  type        = string
  default     = ""  # Default to an empty string if not used
}

variable "acl" {
  description = "The ACL to apply to the S3 bucket"
  type        = string
  default     = "private"  # Default ACL, can be adjusted
}

variable "index_document" {
  description = "The index document for the S3 website"
  type        = string
  default     = "index.html"  # Default index document
}

variable "error_document" {
  description = "The error document for the S3 website"
  type        = string
  default     = "error.html"  # Default error document
}
