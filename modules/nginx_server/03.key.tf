## KeyPair: SSH
resource "aws_key_pair" "nginx-server-ssh" {
  key_name   = "${var.server_name}-ssh"
  public_key = file("ssh_keys/${var.server_name}.key.pub")

  tags = {
    Name         = "${var.server_name}-ssh"
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