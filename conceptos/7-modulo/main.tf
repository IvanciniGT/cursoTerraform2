resource "docker_container" "micontenedor" {
    name        = var.nombre_contenedor
    image       = docker_image.miimagen.image_id # Referencio a otro recurso
    cpu_shares  = var.cuota_cpu
    env         = [ for clave, valor in var.variables_entorno: 
                        "${clave}=${valor}" ]

    # Cuando tenemos un bloque o lista de bloques que condicionalmente deben 
    # aparecer o no o muchas veces, hacemos uso de la palabra "dynamic"
    
    dynamic "ports" {
        for_each = var.puertos_a_exponer # Aqui debemos poner una **LISTA** !!!
        iterator = puerto   # Nombre de la variable donde se irán alcenando 
                            # cada uno de los puertos (elementos de la lista)
                            # suminitrados en el for_each, al iterarlos
        content {
            internal    = puerto.value["interno"]
            external    = puerto.value["externo"]
            ip          = puerto.value["ip"]
        }
    }
}

resource "docker_image" "miimagen" {
    #name = var.imagen
    # Interpolación de variables para generar un texto
    name = "${var.imagen_repo}:${var.imagen_version}"
}
