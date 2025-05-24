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