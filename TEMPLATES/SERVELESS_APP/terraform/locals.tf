locals {
  lambdas_path = "${path.module}/../app/lambdas"
  layers_path  = "${path.module}/../app/layers/nodejs"
  layer_name   = "joi.zip"

  common_tags = {
    Project   = "TODO Serverless App"
    CreatedAt = "2020-03-16"
    ManagedBy = "Terraform"
    Owner     = ["COLOQUE O SEU NOME AQUI!"]  
    Service   = var.service_name
  }
}
