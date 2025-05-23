# provider
provider "aws" {
  region                      = "us-east-1"
  profile                     = "localstack"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    s3 = "http://localhost:4566"
    ec2 = "http://localhost:4566"
  }
}

# resource
resource "aws_instance" "nginx-sever" {
    ami             = "ami-0440d3b780d96b29d"
    instance_type   = "t3.micro"
}