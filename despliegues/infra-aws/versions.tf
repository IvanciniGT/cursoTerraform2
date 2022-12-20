terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.48"
      # Esquema de versionado 3.4.5
      # 3 = MAYOR   Rediseño del sistema / incrementos de funcionalidad => Puede implicar NO RETROCOMPATIBILIDAD
      # 4 = MINOR   Incremento de funcionalidad
      # 5 = MICRO   Incrementamos al arreglar un bug
    }
  }
}

provider "aws" {
 region = "eu-west-1"
}
