# Variables
variable "aws_region" {
  description = "Región de AWS donde se desplegará la infraestructura"
  type        = string
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "Perfil de AWS para la configuración"
  type        = string
  default     = "localstack"
}

variable "endpoint" {
  description = "Puntos finales de AWS para LocalStack"
  type        = string
  default     = "http://localhost:4566"
}

variable "ami_id" {
  description = "ID de la AMI para la instancia EC2"
  type        = string
}

variable "instance_type" {
  description = "Tipo de instancia EC2"
  type        = string
  default     = "t3.micro"
}

variable "server_name" {
  description = "The name of the server"
  type        = string
  default     = "nginx-server"
}

variable "owner" {
  description = "Owner of the infrastructure"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "development"
}

variable "application" {
  description = "Application name"
  type        = string
  default     = "nginx"
}

variable "infra_version" {
  description = "Application version"
  type        = string
  default     = "1.0"
}

variable "description" {
  description = "Resource description"
  type        = string
  default     = "Nginx server for localstack"
}

variable "purpose" {
  description = "Purpose of the resource"
  type        = string
  default     = "Test"
}

variable "created_by" {
  description = "Who created the resource"
  type        = string
  default     = "Terraform"
}

variable "created_on" {
  description = "Creation date"
  type        = string
  default     = "2023-10-01"
}

variable "updated_by" {
  description = "Who last updated the resource"
  type        = string
  default     = "Terraform"
}

variable "updated_on" {
  description = "Last update date"
  type        = string
  default     = "2023-10-01"
}

variable "contact" {
  description = "Contact person"
  type        = string
}

variable "contact_email" {
  description = "Contact email address"
  type        = string
}

variable "team" {
  description = "Team responsible"
  type        = string
  default     = "DevOps"
}

variable "key_name" {
  description = "Name of the SSH key pair"
  type        = string
}