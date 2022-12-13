# Podemos usar comantarios ! Con el cuadradito!

# Script para montar un contenedor con nginx
terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      #version = "2.23.1"
    }
  }
}

# Configuración del proveedor
provider "docker" {
}

#resource "tipo_recurso" "nombre_interno" {
    # Configuración del recurso... que dependerá del tipo de recurso
#}

resource "docker_container" "micontenedor" {
    # Configuración del recurso... que dependerá del tipo de recurso
    name        = "minginx"
    # -p 172.31.44.24:8080:80
    image       = docker_image.miimagen.image_id # Referencio a otro recurso
    
    cpu_shares  = 2048
    env         = [ "VARIABLE1=VALOR1", "VARIABLE2=VALOR2"]
    
    ports {
        internal    = 80
        external    = 8080
        ip          = "127.0.0.1"
    }
    
    ports {
        internal    = 443
        external    = 8444
        ip          = "172.31.44.24"
    }
    
}

# Usando la expresión: docker_image.miimagen se me devuelve un recurso de tipo docker_image
                       #####################
resource "docker_image" "miimagen" {
    name = "nginx:latest"
}

# A la hora de ejecutar un script, terraform calcula un grafo de dependencias
# Para generar ese grafop, terraform se basa precisamente en la DEPENDENCIAS ENTRE RECURSOS