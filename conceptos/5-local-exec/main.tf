terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
    null = {
      source = "hashicorp/null"
    }
  }
}

provider "null" {
}
provider "docker" {
}

resource "docker_container" "micontenedor" {
    count       = 1
    name        = "minginx_${count.index}"
    image       = docker_image.miimagen.image_id # Referencio a otro recurso
    ports {
        internal = 80
        external = 8080 + count.index
    }
    
    provisioner "local-exec" {
        command = "ping -c 5 ${self.network_data[0].ip_address}"
        #on_failure = continue
        #when = destroy
    }
}
locals {
    contenido_fichero_inventario = join("\n",[
                                                        for contenedor in docker_container.micontenedor: 
                                                        "${contenedor.name}=${contenedor.network_data[0].ip_address}" 
                                                    ])
}
resource "null_resource" "actualizar_fichero_inventario" {
    triggers = {
        yo_te_digo_trigo_por_no_decirte_rodrigo = local.contenido_fichero_inventario
    }
    provisioner "local-exec" {
        command = "echo \"$IPS_CONTENEDORES\" > inventario.ini" 
        interpreter = ["/bin/bash","-c"]
        environment = {
            IPS_CONTENEDORES = local.contenido_fichero_inventario
        }
        #on_failure = continue
        #when = destroy
    }
    provisioner "local-exec" {
        command = "rm inventario.ini" 
        when = destroy
    }
}

resource "docker_image" "miimagen" {
    name = "nginx:latest"
}
