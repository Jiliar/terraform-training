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

# Resources
## Instance: Nginx Server
resource "aws_instance" "nginx-sever" {
    ami             = "ami-0440d3b780d96b29d"
    instance_type   = "t3.micro"
    user_data       = <<-EOF
                        #!/bin/bash
                        sudo yum install -y nginx
                        sudo systemctl enable nginx
                        sudo systemctl start nginx
                        EOF

  key_name = aws_key_pair.nginx-server-ssh.key_name
  vpc_security_group_ids = [ aws_security_group.nginx-server-sg.id ]

  tags = {
    Name = "nginx-server"
  }

}

## KeyPair: SSH
resource "aws_key_pair" "nginx-server-ssh" {
      key_name   = "nginx-server-ssh"
      public_key = file("nginx-server.key.pub")  
}

## SecurityGroup
resource "aws_security_group" "nginx-server-sg" {
  name        = "nginx-server-sg"
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
    Name = "nginx-server-sg"
  }

}