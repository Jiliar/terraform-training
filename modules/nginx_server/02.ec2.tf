## EC2 Instance: Nginx Server
resource "aws_instance" "nginx-sever" {
  ami           = var.ami_id
  instance_type = var.instance_type
  user_data     = <<-EOF
                        #!/bin/bash
                        sudo yum install -y nginx
                        sudo systemctl enable nginx
                        sudo systemctl start nginx
                        EOF

  key_name               = aws_key_pair.nginx-server-ssh.key_name
  vpc_security_group_ids = [aws_security_group.nginx-server-sg.id]

  tags = {
    Name         = var.server_name
    Environment  = var.environment
    Application  = var.application
    Owner        = var.owner
    Version      = var.infra_version
    Description  = var.description
    Purpose      = var.purpose
    CreatedBy    = var.created_by
    CreatedOn    = var.created_on
    UpdatedBy    = var.updated_by
    UpdatedOn    = var.updated_on
    Contact      = var.contact
    ContactEmail = var.contact_email
    Team         = var.team
  }

}

# Import
resource "aws_instance" "nginx_server_migration" {
  # Import the existing EC2 instance for dev environment
  # Use the instance ID from AWS
  # terraform import aws_instance.nginx_server_migration i-5828b3f543157cde3
  # terraform state show aws_instance.nginx_server_migration

  ami                                  = "ami-0448d3b780d96b291"
  instance_type                        = "t3.medium"
  security_groups = [
    "nginx-server-dev-sg",
  ]
  vpc_security_group_ids = [
    "sg-1d754d2542753cd6e",
  ]

  tags = {
    Name         = var.server_name
    Environment  = var.environment
    Application  = var.application
    Owner        = var.owner
    Version      = var.infra_version
    Description  = var.description
    Purpose      = var.purpose
    CreatedBy    = var.created_by
    CreatedOn    = var.created_on
    UpdatedBy    = var.updated_by
    UpdatedOn    = var.updated_on
    Contact      = var.contact
    ContactEmail = var.contact_email
    Team         = var.team
  }
}