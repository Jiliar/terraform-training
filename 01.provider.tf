# Provider
provider "aws" {
  region                      = var.aws_region
  profile                     = var.aws_profile
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    s3  = var.endpoint
    ec2 = var.endpoint
  }
}
