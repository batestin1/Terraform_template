locals {
  ip_filepath = "ips.json"

  common_tags = {
    Service     = "Curso Terraform"
    ManagedBy   = "Terraform"
    Environment = var.environment
    Owner       = ["COLOQUE O SEU NOME AQUI!"]  
  }
}
