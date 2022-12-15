terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

provider "docker" {
}

resource "docker_container" "micontenedor" {
    count       = 3
    name        = "minginx_${count.index}"
    image       = docker_image.miimagen.image_id 
}

resource "docker_image" "miimagen" {
    name = "nginx:latest"
}
