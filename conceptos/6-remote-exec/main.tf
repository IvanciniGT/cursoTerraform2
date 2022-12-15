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
    
    connection { # https://developer.hashicorp.com/terraform/language/resources/provisioners/connection
        type = "ssh"
        host = self.network_data[0].ip_address
        port = 22
        user = "root"
        password = "root"
    }
    
    provisioner "remote-exec"{
        inline = ["echo Dentro del contenedor","echo EUREKA "]
    }
    provisioner "remote-exec"{
        script = "./script.sh"
    }
    #provisioner "remote-exec"{
    #    scripts = ["script1.sh","scripts.sh"]
    #}
    provisioner "file" {    # Copiar un fichero
        destination = "/tmp/fichero1.txt"
        source = "./main.tf"
    }
    
    provisioner "file" {    # Crear un fichero
        destination = "/tmp/fichero2.txt"
        content = "Soy el contenido del fichero" //templatefile()
    }
    
}

resource "docker_image" "miimagen" {
    name = "rastasheep/ubuntu-sshd:latest"
}
