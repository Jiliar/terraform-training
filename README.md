
# 🚀 Terraform Training con AWS + LocalStack

¡Bienvenido al repositorio de entrenamiento con **Terraform** para desplegar infraestructura en AWS, usando **LocalStack** como entorno local simulado! 🧪☁️

---

## 🧰 Requisitos

- Terraform >= 1.0
- AWS CLI
- LocalStack (puedes usar `docker` o `docker-compose`)
- VSCode + extensión Terraform
- Cuenta de AWS (para pruebas reales)

---

## 🛠 Instalación de Terraform

```bash
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
brew update
terraform -version
```

---

## 🖥 Herramientas Adicionales

- AWS CLI:
  ```bash
  aws configure
  ```
- LocalStack:
  ```bash
  export AWS_ACCESS_KEY_ID=test
  export AWS_SECRET_ACCESS_KEY=test
  export AWS_DEFAULT_REGION=us-east-1
  export AWS_ENDPOINT_URL=http://localhost:4566
  ```

---

## 📁 Estructura de Archivos

```bash
00.variables.tf       # Variables globales
01.provider.tf        # Configuración del proveedor AWS
02.ec2.tf             # Instancia EC2 con Nginx
03.key.tf             # SSH key para la instancia
04.sg.tf              # Security Group (puertos 22 y 80)
99.outputs.tf         # Outputs
terraform.tfvars      # Variables por defecto
```

---

## 📦 Primer Proyecto en Terraform

```bash
terraform init     # 🔧 Inicializar el proyecto
terraform plan     # 🔍 Ver plan de ejecución
terraform apply    # 🚀 Aplicar cambios
terraform destroy  # 💥 Eliminar infraestructura
```

---

## 🌍 Infraestructura a Desplegar

✅ Instancia EC2 con Nginx  
✅ Apertura de puertos 22 (SSH) y 80 (HTTP)  
✅ Clave SSH generada manualmente  
✅ Outputs con IP pública  

```hcl
resource "aws_instance" "nginx-server" {
  ami           = var.ami_id
  instance_type = "t3.micro"
  user_data     = file("scripts/nginx.sh")
  key_name      = "nginx-server"
  ...
}
```

---

## 🔐 Generación de Clave SSH

```bash
ssh-keygen -t rsa -b 2048 -f ~/.ssh/nginx-server.key
```

---

## 🔍 Ver Instancias con AWS CLI

```bash
aws ec2 describe-instances \
  --filters Name=instance-state-name,Values=running \
  --query "Reservations[*].Instances[*].{ID:InstanceId,PublicIP:PublicIpAddress}" \
  --endpoint-url=http://localhost:4566
```

---

## 🧪 Test de Puertos

```bash
curl http://<public-ip>      # Verifica Nginx
ssh ec2-user@<public-ip> -i nginx-server.key
```

---

## 📤 Outputs

```hcl
output "public_ip" {
  description = "Dirección IP pública de la instancia EC2"
  value       = aws_instance.nginx-server.public_ip
}
```

---

## 📦 Variables y Entornos

```hcl
variable "ami_id" {
  description = "AMI ID para EC2"
  default     = "ami-xxxxxxxx"
}
```

```bash
terraform plan -var-file=envs/dev.tfvars
terraform plan -var-file=envs/prd.tfvars
```

---

## 📦 Módulos

Reutiliza bloques con módulos. Cada módulo requiere:

```bash
terraform init
```

---

## 📄 .tfstate y S3

El archivo `terraform.tfstate` **no se debe subir al repositorio**.

Puedes simular un bucket S3 en LocalStack para guardar el estado:

```bash
aws --endpoint-url=http://localhost:4566 s3api create-bucket --bucket terraform-tfstate
```

---

## 📥 Importar Recursos

```bash
terraform import aws_instance.server-web i-0bc9cc7f8a4bf51bb
terraform state show aws_instance.server-web
```

---

## 📚 Recursos

- [Documentación oficial de Terraform](https://developer.hashicorp.com/terraform/docs)
- [LocalStack Docs](https://docs.localstack.cloud)
- [AWS CLI Reference](https://docs.aws.amazon.com/cli/latest/reference/)

---

¡Feliz automatización! ⚙️🌐
