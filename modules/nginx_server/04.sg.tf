## SecurityGroup
resource "aws_security_group" "nginx-server-sg" {
  name        = "${var.server_name}-sg"
  description = "Allow HTTP and SSH traffic"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name         = "${var.server_name}-sg"
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