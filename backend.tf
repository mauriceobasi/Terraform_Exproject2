terraform {
  backend "s3" {
    bucket         = "projectstatefileassignment111"  # Replace with your S3 bucket name
    key            = "terraform/state"            # Path within the bucket
    region         = "us-east-1"                  # Replace with your AWS region
    encrypt        = true                          # Optional: Enable encryption for the state file
  }
}
