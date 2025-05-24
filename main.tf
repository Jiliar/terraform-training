# tfstate

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "local" {
    path = "terraform.tfstate"
  }

  # Uncomment the following lines to use S3 as a backend for state management
  # We are working with LocalStack, so this is commented out.
  # backend "s3" {
  #  bucket = "terraform-tfstate"
  #  key    = "terraform-tfstate/nginx_server/terraform.tfstate"
  #  region = "us-east-1"
  # }

}


# Modulos
module "nginx_server_dev" {

  source = "./modules/nginx_server"

  ami_id        = "ami-0448d3b780d96b291"
  instance_type = "t3.medium"
  aws_profile   = "localstack"
  server_name   = "nginx-server-dev"
  environment   = "dev"
  description   = "Nginx server for dev environment"
  purpose       = "Development"
  created_by    = "Terraform"
  created_on    = "2025-05-24"
  updated_by    = "Terraform"
  updated_on    = "2025-05-24"

}

module "nginx_server_tst" {

  source = "./modules/nginx_server"

  ami_id        = "ami-0448d3b780d96b292"
  instance_type = "t3.medium"
  aws_profile   = "localstack"
  server_name   = "nginx-server-tst"
  environment   = "tst"
  description   = "Nginx server for tst environment"
  purpose       = "Testing"
  created_by    = "Terraform"
  created_on    = "2025-05-24"
  updated_by    = "Terraform"
  updated_on    = "2025-05-24"

}

# Outputs DEV
output "server_dev_ip" {
  description = "Dirección IP pública de la instancia EC2 - DEV"
  value       = module.nginx_server_dev.server_public_ip
}

output "server_dev_dns" {
  description = "DNS pública de la instancia EC2 - DEV"
  value       = module.nginx_server_dev.server_public_dns
}

# Outputs TST
output "server_tst_ip" {
  description = "Dirección IP pública de la instancia EC2 - TST"
  value       = module.nginx_server_tst.server_public_ip
}

output "server_tst_dns" {
  description = "DNS pública de la instancia EC2 - TST"
  value       = module.nginx_server_tst.server_public_dns
}
