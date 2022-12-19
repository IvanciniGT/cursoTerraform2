terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

provider "docker" {
}

module "nginx" {
    source = "../7-modulo"
    # https://developer.hashicorp.com/terraform/language/modules/sources
    nombre_contenedor   = "minginx1.prod.es"
    imagen_repo         = "nginx"

}

output "direccion_ip" {
    value = module.nginx.direccion_ip
}