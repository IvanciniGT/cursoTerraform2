resource "docker_container" "micontenedor" {
    name        = var.nombre_contenedor
    image       = docker_image.miimagen.image_id # Referencio a otro recurso
    cpu_shares  = var.cuota_cpu
    env         = var.variables_entorno
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

resource "docker_image" "miimagen" {
    #name = var.imagen
    # Interpolación de variables para generar un texto
    name = "${var.imagen_repo}:${var.imagen_version}"
}
