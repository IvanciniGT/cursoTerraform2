
# Que devuelve docker_container.micontenedor ~> Una lista de recursos de tipo docker_container
resource "docker_container" "micontenedor" {
    
    count       = var.numero_contenedores # Aqui debemos suministar un número
    # Cuando usamos la palabra count, 
    # podemos usar la variable count.index
    # Para saber en que iteración me encuentro
    name        = "minginx_${count.index}"
    image       = docker_image.miimagen.image_id # Referencio a otro recurso
    
    ports {
        internal    = 80
        external    = 8080 + count.index
        ip          = "127.0.0.1"
    }
}

resource "docker_container" "balanceador_de_carga" {
    
    # Quiero 1 ... o ninguno !
    count       = var.numero_contenedores == 1 ? 0 : 1
    name        = "balanceador"
    image       = docker_image.miimagen.image_id # Referencio a otro recurso
    
    ports {
        internal    = 80
        external    = 9000
        ip          = "127.0.0.1"
    }
}

resource "docker_container" "mis_contenedores_personalizados" {
    
    for_each    = var.contenedores_personalizados # Aqui debemos poner un **MAPA** !!!
    # Al usar un for_each dentro de un resource, tenemos a nuestra disposición 
    # La variable each, a la que podemos pedir el each.key y el each.value
    name        = each.key
    image       = docker_image.miimagen.image_id # Referencio a otro recurso
    
    ports {
        internal    = 80
        external    = each.value
        ip          = "127.0.0.1"
    }
}

resource "docker_image" "miimagen" {
    name = "nginx:latest"
}