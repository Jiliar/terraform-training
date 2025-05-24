# Outputs
output "server_public_ip" {
  description = "Dirección IP pública de la instancia EC2"
  value = aws_instance.nginx-sever.public_ip
}

output "server_public_dns" {
  description = "DNS pública de la instancia EC2"
  value = aws_instance.nginx-sever.public_dns
}